/**
 * DependencyTests.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 30th 2023, 6:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import XCTest
@testable import Syringe

final class ModuleTests: XCTestCase {
    
    override class func tearDown() {
        cleanSyringe()
    }

    func testModulesDontPullOtherModuleDependencies() {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let api: TestAPI = get() else {
            return
        }
        
        api.run()
    }
    
    func testModulesPullSameModuleDependencies() {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let api: TestAPI = get() else {
            XCTFail()
            return
        }
        
        api.run()
    }
    
    func testModuleDependenciesAreResolvedInRegistrationOrder() {
        defer {
            cleanSyringe()
        }
        
        injectSyringe {
            modules {
                module {
                    singleton { _ in TestAPI(config: TestConfig(url: "Module 1"))}
                }
                module {
                    singleton { _ in TestAPI(config: TestConfig(url: "Module 2"))}
                }
            }
        }
        
        guard let api: TestAPI = inject() else {
            XCTFail()
            return
        }
        
        // Check that the Module name is not Module 2
        XCTAssert(api.config.url != "Module 2")
    }
}
