/**
 * Container.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

// MARK: Neede container

/// A Container is the central point for Syringe DI. It hosts all modules and therefore manages all dependencies.
public final class Container {
    
    internal static var global: Container!
    
    private var modules: [Module] = []
    internal var logger: SyringeLogger!
    
    internal init() {
    }
    
    internal init(logger: SyringeLogger) {
        self.logger = logger
    }
    
    /// Gets a dependency of type T,
    /// - Parameter named Optional name to query for
    /// - Parameter arguments An array of arguments to supply upon resolve. Can be empty
    public func get<T>(named: String! = nil, _ arguments: [Any] = []) -> T? {
        getDependency(named: named, arguments: arguments)
    }
    
    internal func addModule(_ module: Module) -> Void {
        self.modules.append(module)
    }
    
    private func getDependency<T>(named: String!, arguments: [Any] = []) -> T? {
        for module in modules {
            if let depedency: T = module.get(named: named, arguments: arguments) {
                logger?.log(level: .info, message: .resolve(type: T.self))
                return depedency
            }
        }
        
        return nil
    }
}
