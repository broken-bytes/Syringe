/**
 * Factory.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

/// Creates a new factory
/// - Parameter resolver Closure that returns the instanced object from this factory.
public func factory<T>(_ resolver: @escaping (Module) -> T) -> any Resolvable {
    SyringeResolver<T>(scope: .factory, resolver)
}

/// Creates a new factory
/// - Parameter named The name to be used for this factory
/// - Parameter resolver Closure that returns the instanced object from this factory.
public func factory<T>(named: String, _ resolver: @escaping (Module) -> T) -> any Resolvable {
    SyringeResolver<T>(named: named, scope: .factory, resolver)
}

/// Creates a new factory
/// - Parameter resolver Closure that returns the instanced object from this factory.
public func factory<T>(_ resolver: @escaping (Module, ResolverParameters) -> T) -> any Resolvable {
    SyringeResolver<T>(scope: .factory, resolver)
}

/// Creates a new factory
/// - Parameter named The name to be used for this factory
/// - Parameter resolver Closure that returns the instanced object from this factory.
public func factory<T>(named: String, _ resolver: @escaping (Module, ResolverParameters) -> T) -> any Resolvable {
    SyringeResolver<T>(named: named, scope: .factory, resolver)
}

