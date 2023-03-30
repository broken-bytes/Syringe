/**
 * ModuleBuilder.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

@resultBuilder
public struct ModuleBuilder {
    
    public static func buildBlock(_ dependencies: any Resolvable...) -> Module {
        let module: Module = Module()
        
        for dependency in dependencies {
            module.addResolvable(resolvable: dependency)
        }
        
        return module
    }
}
