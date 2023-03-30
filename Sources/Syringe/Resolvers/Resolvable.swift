/**
 * Resolvable.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

// MARK: Public Protocol

/// Resolvable is used as a dummy protocol that only holds a associatedtype. It is used to enable DSL from other modules without having to mark every method public.
public protocol Resolvable: Dependency {
    
    associatedtype Object
    
    func onInit(_ lateResolver: @escaping (Object) -> Void) -> any Resolvable
}

// MARK: Internal Protocol

/// ResolvableInternal is the protocol that all SyringeResolvers conform to. Since it refines Resolvable, it can be used internally while alllowing users to use the public Resolvable for DSL purposes.
internal protocol ResolvableInternal: Resolvable {
    
    var type: Object.Type { get }
    var name: String! { get }
    var lateResolver: ((Object) -> Void)! { get }
    
    func resolve(_ module: Module) -> Object
    func resolve(_ module: Module, _ arguments: [Any]) -> Object
}

// MARK: NeedResolver Type
/// SyringeResolver is the type that contains information regarding how and with what parameters a dependency can be resolved.
internal final class SyringeResolver<T>: ResolvableInternal {

    public typealias Object = T
    internal let type: Object.Type
    internal let name: String!
    internal var lateResolver: ((Object) -> Void)!
    internal lazy var module: Module! = nil
    private var resolver: ((Module) -> Object)!
    private var resolverArgs: ((Module, ResolverParameters) -> Object)!
    private var instance: T!
    private let scope: ResolvableScope
    private var childLateResolvers: [((Object) -> Void)] = []
    
    // MARK: -- Lifetime Methods(inits/deinits)
    
    internal init(named: String! = nil, scope: ResolvableScope) {
        self.name = named
        self.type = Object.self
        self.scope = scope
    }
    
    internal convenience init(named: String! = nil, scope: ResolvableScope, _ resolver: @escaping (Module) -> Object) {
        self.init(named: named, scope: scope)
        self.resolver = resolver
    }
    
    internal convenience init(named: String! = nil, scope: ResolvableScope, _ resolver: @escaping (Module, ResolverParameters) -> Object) {
        self.init(named: named, scope: scope)
        self.resolverArgs = resolver
    }
    
    deinit {
        instance = nil
    }
    
    // MARK: -- Public Methods
    
    public func onInit(_ lateResolver: @escaping (Object) -> Void) -> any Resolvable {
        self.lateResolver = lateResolver
        return self
    }
    
    // MARK: -- Internal Methods
    
    /// Called by circular dependencies when the other dependency has resolved
    internal func onLateInit(object: Object) {
        self.lateResolver?(object)
    }
    
    internal func resolve(_ module: Module) -> Object {
        self.module = module

        var resolved: T! = nil
                
        switch scope {
            case .factory:
                resolved = factory()
            case .singleton:
                resolved = singleton()
        }
                
        return resolved
    }
    
    internal func resolve(_ module: Module, _ arguments: [Any]) -> Object {
        let params = ResolverParameters(params: arguments)
        self.module = module

        var resolved: Object! = nil
        
        switch scope {
            case .factory:
                resolved = factory(params)
            case .singleton:
                resolved = singleton(params)
        }
                
        return resolved
    }
    
    // MARK: -- Private Methods
    
    private func factory() -> Object {
        guard let resolver else {
            fatalError("Trying to create a new instance of type \(Object.self) from factory without parameters but registered factory takes parameters.")
        }
        
        return resolver(module)
    }
    
    private func factory(_ parameters: ResolverParameters) -> Object {
        guard let resolverArgs else {
            fatalError("Trying to create a new instance of type \(Object.self) from factory with parameters but registered singleton takes no parameters.")
            
        }
        
        return resolverArgs(module, parameters)
    }
    
    private func singleton() -> Object {
        if instance == nil {
            // Guard for singletons that need parameters but not yet been resolved. An already resolved singleton can be resolved without parameters as the instance is not meant to change.
            guard let resolver else {
                fatalError("Trying to resolve singleton of type \(Object.self) without parameters but registered singleton takes parameters.")
            }
            
            instance = resolver(module)
        }
        
        return instance
    }
    
    private func singleton(_ parameters: ResolverParameters) -> Object {
        // Check that we have a resolver going that takes parameters. Otherwise we are trying to supply parameters to a resolver that takes none.
        guard let resolverArgs else {
            fatalError("Trying to resolve singleton of type \(Object.self) with parameters but registered singleton takes no parameters.")
        }
        
        if instance == nil {
            instance = resolverArgs(module, parameters)
        } else {
            // Send a warning because subsequent resolves for a singleton resolver with parameters ignore following parameters.
            print("Warning: You are trying to resolve a singleton with parameters that has already been resolved. Parameters will be ignored")
        }
        
        return instance
    }
}
