/**
 * NeedleApplication.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

/// A NeedleApplication is the central point for needle DI. It hosts all modules and therefore manages all dependencies.
public final class NeedleApplication {
    
    internal static var global: NeedleApplication!
    
    private var modules: [Module] = []
    private var logger: NeedleLogger!
    
    internal init() {
        
    }
    
    internal init(logger: NeedleLogger) {
        self.logger = logger
    }
    
    /// Gets a dependency of type T,
    /// - Parameter named Optional name to query for
    public func get<T>(named: String! = nil) -> T {
        for module in modules {
            if let depedency: T = module.get(named: named) {
                return depedency
            }
        }
                
        fatalError("Dependency \(T.self) not found. Did you register it?")
    }
    
    /// Gets a dependency of type T,
    /// - Parameter named Optional name to query for
    /// - Parameter arguments An array of arguments to supply upon resolve
    public func get<T>(named: String! = nil, _ arguments: [Any]) -> T {
        for module in modules {
            if let depedency: T = module.get(named: named, arguments: arguments) {
                return depedency
            }
        }
        
        fatalError("Dependency not found. Did you register it?")
    }
    
    internal func addModule(_ module: Module) -> Void {
        self.modules.append(module)
    }
}

// MARK: Free Functions for global NeedleApplication

/// Creates a new NeedleApplication
public func needleContainer(@NeedleApplicationBuilder _ builder: () -> NeedleApplication) -> NeedleApplication {
    builder()
}

/// Creates a NeedleApplication that is bound to global scope. Enabled the free function DSL
public func startNeedle(@NeedleApplicationBuilder _ builder: () -> NeedleApplication) -> Void {
    NeedleApplication.global = builder()
}

/// Stops the global needle instance.
public func stopNeedle() {
    NeedleApplication.global = nil
}

public func modules(@NeedleApplicationModuleBuilder _ builder: () -> [Module]) -> [Module] {
    builder()
}

public func get<T>(named: String! = nil) -> T {
    guard let container = NeedleApplication.global else {
        fatalError("Global Container not present. Did you forget to call `startNeedle()`")
    }
    
    return container.get(named: named)
}

public func get<T>(named: String! = nil, _ arguments: Any...) -> T {
    guard let container = NeedleApplication.global else {
        fatalError("Global Container not present. Did you forget to call `startNeedle()`")
    }
    
    return container.get(named: named, arguments.compactMap { $0 })
}
