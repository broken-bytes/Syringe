public final class Module {

    private var factories: [any AnyFactory] = []
    
    public init() {

    }

    internal func addFactory(factory: any AnyFactory) {
        factories.append(factory)
    }
}

extension Module: CustomDebugStringConvertible {
    public var debugDescription: String {
        factories.compactMap { $0 }.reduce("", { $0 + "\($1)" })
    }
}

@ModuleBuilder
public func module(_ module: () -> Void) -> Module {
    
}