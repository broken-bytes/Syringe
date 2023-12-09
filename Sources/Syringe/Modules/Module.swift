/**
 * Module.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

public final class Module {

    private var resolvables: [any ResolvableInternal] = []
    
    // Make init internal so it is only creatable via the DSL
    internal init() {
        
    }
    
    internal func addResolvable(resolvable: any Resolvable) {
        resolvables.append(resolvable as! (any ResolvableInternal))
    }
    
    public func get<T>(named: String! = nil) -> T? {
        getDependency(named: named)
    }
    
    public func get<T>(named: String! = nil, arguments: [Any]) -> T? {
        getDependency(named: named, args: arguments)
    }
    
    private func getDependency<T>(named: String!, args: [Any] = []) -> T? {
        // Go through all dependencies and see if we have a type match
        for resolvable in resolvables {
            if resolvable.type == T.self && resolvable.name == named {
                var dependency: T?
                
                if args.isEmpty {
                    dependency = resolvable.resolve(self) as? T
                } else {
                    dependency = resolvable.resolve(self, args) as? T
                }
                
                guard let dependency else { fatalError() }
                guard let typedResolvable = resolvable as? SyringeResolver<T> else { fatalError() }
                typedResolvable.onLateInit(module: self, object: dependency)
                return dependency
            }
        }
        
        return nil
    }
}

extension Module: CustomDebugStringConvertible {
    public var debugDescription: String {
        resolvables.compactMap { $0 }.reduce("", { $0 + "\($1)" })
    }
}
