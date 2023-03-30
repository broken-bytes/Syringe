/**
 * Singleton.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

/// Creates a new singleton dependency
/// - Parameter resolver Closure that returns the instanced singleton
public func singleton<T>(_ resolver: @escaping (Module) -> T) -> any Resolvable {
    SyringeResolver<T>(scope: .singleton, resolver)
}

/// Creates a new singleton dependency
/// - Parameter named The name to be used for this singleton
/// - Parameter resolver Closure that returns the instanced singleton
public func singleton<T>(named: String, _ resolver: @escaping (Module) -> T) -> any Resolvable {
    SyringeResolver<T>(named: named, scope: .singleton, resolver)
}

/// Creates a new singleton dependency
/// - Parameter resolver Closure that returns the instanced singleton. Also takes parameters to pass upon creation
public func singleton<T>(_ resolver: @escaping (Module, ResolverParameters) -> T) -> any Resolvable {
    SyringeResolver<T>(scope: .singleton, resolver)
}

/// Creates a new singleton dependency
/// - Parameter named The name to be used for this singleton
/// - Parameter resolver Closure that returns the instanced singleton. Also takes parameters to pass upon creation
public func singleton<T>(named: String, _ resolver: @escaping (Module, ResolverParameters) -> T) -> any Resolvable {
    SyringeResolver<T>(named: named, scope: .singleton, resolver)
}

