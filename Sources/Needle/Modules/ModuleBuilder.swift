/**
 * ModuleBuilder.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

@resultBuilder
struct ModuleBuilder {

    static func buildBlock(_ resolvables: any Resolvable...) -> Module {
        let module: Module = Module()

        for resolvable in resolvables {
            module.addResolvable(resolvable: resolvable)
        }

        return module
    }
}
