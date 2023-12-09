/**
 * Container+DSLFunctions.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

// MARK: Container free functions
/// Creates a new Container
public func makeContainer(@ContainerBuilder _ builder: () -> Container) -> Container {
    builder()
}

/// Creates a new Container with a given identifier
/// - Parameter identifier The identifier to be used for this container
public func registerContainer(key: any Hashable, @ContainerBuilder _ builder: () -> Container) {
    registerContainer(key: key, container: builder())
}

/// Creates a new Container with a given identifier
/// - Parameter identifier The identifier to be used for this container
public func registerContainer(key: any Hashable, container: Container) {
    let containerKey = ContainerKey(key: key)
    
    if let container = Container.containers.first(where: { $0.key.hashValue == key.hashValue }) {
        container.value.logger?.log(level: SyringeLogLevel.warn, message: SyringeLogAction.registerContainer(message: "Container with key \(key) is already registered"))
        return
    }
    
    Container.containers[containerKey] = container
}

/// Removes a previously created container from the container registry
/// - Parameter for The key to be used for removal
public func removeContainer(for key: any Hashable) {
    let containerKey = ContainerKey(key: key)
    
    let container = Container.containers.removeValue(forKey: containerKey)
    
    container?.logger?.log(level: .info, message: .removeContainer(message: "Container \(String(describing: container)) was removed"))
}

/// Retrieves a previously created container via its key
/// - Parameter for The key to be used for retrieval
public func findContainer(for key: any Hashable) -> Container? {
    if let found = Container.containers.first(where: {
        $0.key.key.hashValue == key.hashValue }
    )?.value {
        return found
    }
    
    print("Failed to get container.\nNo container with key \(key) was registered previously.")
    return nil
}

/// Creates a Container that is bound to global scope. Enabled the free function DSL
public func injectSyringe(@ContainerBuilder _ builder: () -> Container) -> Void {
    if Container.global != nil {
        Container.global.logger?.log(
            level: .warn,
            message: .startSyringe(message: "A global instance is already present. This is usually unintended. The current instance will not be overriden.")
        )
    
        return
    }
    
    let container = builder()
    
    container.logger?.log(level: .info, message: .startSyringe(message: "Syringe will be injected"))
    
    Container.global = builder()
}

/// Stops the global Syringe instance.
public func cleanSyringe() {
    Container.global?.logger?.log(level: .info, message: .endSyringe(message: "Syringe will be cleared"))
    Container.global = nil
}

/// Builds an array of modules via a resultBuilder
public func modules(@ModulesBuilder _ builder: () -> [Module]) -> [Module] {
    builder()
}

/// Gets a dependency by type and name
public func get<T>(named: String! = nil) -> T? {
    guard let container = Container.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named)
}

/// Gets a dependency by type and name and passes arguments
public func get<T>(named: String! = nil, _ arguments: Any...) -> T? {
    guard let container = Container.global else {
        print("Syringe: No global scope running. Is this intended? You might have forgotten to call startSyringe()")
        return nil
    }
    
    return container.get(named: named, arguments.compactMap { $0 })
}
