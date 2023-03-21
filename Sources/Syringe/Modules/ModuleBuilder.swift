/**
 * ModuleBuilder.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

@resultBuilder
struct ModuleBuilder {

    static func buildBlock(_ dependencies: any Dependency...) -> Module {
        let module: Module = Module()

        for dependency in dependencies {
            if let resolvable = dependency as? any Resolvable {
                module.addResolvable(resolvable: resolvable)
                continue
            }
        }

        return module
    }
}
