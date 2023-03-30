/**
 * Container+DSLFunctions.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

// MARK: Free Functions for global Container

/// Creates a new Container
public func syringeContainer(@ContainerBuilder _ builder: () -> Container) -> Container {
    builder()
}

/// Creates a new Container with a given identifier
/// - Parameter identifier The identifier to be used for this container
public func registerContainer(key: any Hashable, container: Container) {
    let containerKey = ContainerKey(key: key)
    Container.containers[containerKey] = container
}

public func container(for key: any Hashable) -> Container? {
    return Container.containers.first(where: {
        print($0.key.hashValue)
        print(key.hashValue)
        return $0.key.key.hashValue == key.hashValue }
    )?.value
}

/// Creates a Container that is bound to global scope. Enabled the free function DSL
public func injectSyringe(@ContainerBuilder _ builder: () -> Container) -> Void {
    if Container.global != nil {
        Container.global.logger?.log(
            level: .warn,
            message: .startSyringe(message: "A global instance is already present. The current instance will be overriden. This is usually unintended.")
        )
    }
    
    Container.global = builder()
}

/// Stops the global Syringe instance.
public func stopSyringe() {
    Container.global = nil
}

/// Builds an array of modules via a resultBuilder
public func modules(@ModulesBuilder _ builder: () -> [Module]) -> [Module] {
    builder()
}

/// Gets a dependency by type and name
public func inject<T>(named: String! = nil) -> T? {
    guard let container = Container.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named)
}

/// Gets a dependency by type and name and passes arguments
public func inject<T>(named: String! = nil, _ arguments: Any...) -> T? {
    guard let container = Container.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named, arguments.compactMap { $0 })
}
