/**
 * Singleton.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

public func singleton<T>(_ resolver: @escaping () -> T) -> any Resolvable {
    NeedleResolver<T>(scope: .singleton, resolver)
}

public func singleton<T>(named: String, _ resolver: @escaping () -> T) -> any Resolvable {
    NeedleResolver<T>(named: named, scope: .singleton, resolver)
}

public func singleton<T>(_ type: T.Type, _ resolver: @escaping () -> T) -> any Resolvable {
    NeedleResolver<T>(scope: .singleton, resolver)
}

public func singleton<T>(_ type: T.Type, named: String, _ resolver: @escaping () -> T) -> any Resolvable {
    NeedleResolver<T>(named: named, scope: .singleton, resolver)
}

public func singleton<T>(_ resolver: @escaping (ResolverParameters) -> T) -> any Resolvable {
    NeedleResolver<T>(scope: .singleton, resolver)
}

public func singleton<T>(named: String, _ resolver: @escaping (ResolverParameters) -> T) -> any Resolvable {
    NeedleResolver<T>(named: named, scope: .singleton, resolver)
}

public func singleton<T>(_ type: T.Type, _ resolver: @escaping (ResolverParameters) -> T) -> any Resolvable {
    NeedleResolver<T>(scope: .singleton, resolver)
}

public func singleton<T>(_ type: T.Type, named: String, _ resolver: @escaping (ResolverParameters) -> T) -> any Resolvable {
    NeedleResolver<T>(named: named, scope: .singleton, resolver)
}

