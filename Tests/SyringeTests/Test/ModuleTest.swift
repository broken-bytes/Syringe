//
//  ModuleTest.swift
//  
//
//  Created by Marcel Kulina on 30.03.23.
//

import XCTest
@testable import Syringe

final class ModuleTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testModulesDontPullOtherModuleDependencies() {
        let moduleA = module {
            factory { _ in
                TestConfig(url: "")
            }
        }
        
        let moduleB = module {
            singleton { (module: Module) -> TestAPI in
                let config: TestConfig? = module.get()
                
                // Config must be nil as it has not been registered in this module
                XCTAssertNil(config)
                
                return TestAPI(config: TestConfig(url: ""))
                
            }
        }
        
        injectSyringe {
            modules {
                moduleA
                moduleB
            }
        }
        
        guard let api: TestAPI = inject() else {
            return
        }
    }
    
    func testModulesPullSameModuleDependencies() {
        let moduleA = module {
            factory { _ in
                TestConfig(url: "")
            }
            singleton { (module: Module) -> TestAPI in
                let config: TestConfig? = module.get()
                
                // Config must be available as it has been registered in this module
                XCTAssertNotNil(config)
                
                return TestAPI(config: TestConfig(url: ""))
                
            }
        }
        
        injectSyringe {
            modules {
                moduleA
            }
        }
        
        guard let api: TestAPI = inject() else {
            XCTFail()
            return
        }
    }
}
