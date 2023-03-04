@resultBuilder 
struct ModuleBuilder {

    static func buildBlock(_ factories: any AnyFactory...) -> Module {
        var module: Module = Module()

        for factory in factories {
            module.addFactory(factory: factory)
        }

        return module
    }
}