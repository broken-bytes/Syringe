/**
 * Module.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

public final class Module {

    private var resolvables: [any ResolvableInternal] = []
    
    public init() {

    }
    
    public func onInit<T>(_ closure: @escaping (T) -> Void) -> Module {
        self
    }

    internal func addResolvable(resolvable: any Resolvable) {
        resolvables.append(resolvable as! (any ResolvableInternal))
    }
    
    internal func get<T>(named: String! = nil) -> T? {
        // Check all possible resolvables for the desired type and identifier(null because non supplied here)
        for resolvable in resolvables {
            if resolvable.type == T.self && resolvable.name == named {
                return resolvable.resolve() as? T
            }
        }
        
        return nil
    }
    
    internal func get<T>(named: String! = nil, arguments: [Any]) -> T? {
        for resolvable in resolvables {
            if resolvable.type == T.self && resolvable.name == named {
                return resolvable.resolve(arguments) as? T
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

public func module(@ModuleBuilder resolvables: () -> Module) -> Module {
    resolvables()
}
