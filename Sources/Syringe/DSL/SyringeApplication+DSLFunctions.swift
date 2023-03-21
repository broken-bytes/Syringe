/**
 * SyringeApplication+DSLFunctions.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

// MARK: Free Functions for global SyringeApplication

/// Creates a new SyringeApplication
public func SyringeContainer(@SyringeApplicationBuilder _ builder: () -> SyringeApplication) -> SyringeApplication {
    builder()
}

/// Creates a SyringeApplication that is bound to global scope. Enabled the free function DSL
public func injectSyringe(@SyringeApplicationBuilder _ builder: () -> SyringeApplication) -> Void {
    if SyringeApplication.global != nil {
        SyringeApplication.global.logger?.log(
            level: .warn,
            message: .startSyringe(message: "A global instance is already present. The current instance will be overriden. This is usually unintended.")
        )
    }
    
    SyringeApplication.global = builder()
}

/// Stops the global Syringe instance.
public func stopSyringe() {
    SyringeApplication.global = nil
}

/// Builds an array of modules via a resultBuilder
public func modules(@ModulesBuilder _ builder: () -> [Module]) -> [Module] {
    builder()
}

/// Gets a dependency by type and name
public func get<T>(named: String! = nil) -> T? {
    guard let container = SyringeApplication.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named)
}

/// Gets a dependency by type and name and passes arguments
public func get<T>(named: String! = nil, _ arguments: Any...) -> T? {
    guard let container = SyringeApplication.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named, arguments.compactMap { $0 })
}
