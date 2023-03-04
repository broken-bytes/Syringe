public protocol AnyFactory {

    associatedtype Object

    func resolve() -> Object
}

public class Factory<T>: AnyFactory {

    public typealias Object = T
    private let resolver: () -> T

    public init(_ resolver: @escaping () -> T) {
        self.resolver = resolver
    }

    public func resolve() -> T {
        resolver() 
    }
}

public func factory<T>(_ resolver: @escaping () -> T) -> any AnyFactory {
    Factory<T>(resolver)
}