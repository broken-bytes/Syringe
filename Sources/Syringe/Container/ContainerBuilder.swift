/**
 * ContainerBuilder.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

@resultBuilder
public struct ContainerBuilder {
    
    public static func buildBlock(_ modules: [Module]) -> Container {
        let app = Container()
        
        for module in modules {
            app.addModule(module)
        }
    
        return app
    }
    
    public static func buildBlock(_ logger: SyringeLogger, _ modules: [Module]) -> Container {
        let app = Container(logger: logger)
                
        for module in modules {
            app.addModule(module)
        }
        
        return app
    }
}
