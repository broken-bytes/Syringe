/**
 * DependencyTests.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import XCTest
@testable import Syringe

final class TestCircularDependencies: XCTestCase {

    override func setUpWithError() throws {
        let testModule = module {
            singleton { TestConfig(url: "") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTypeCastingIsResolved() throws {
        let testModule = module {
            singleton {
                TestServiceLive(repository: get()!) as TestService
            }
            singleton { TestRepository(api: TestAPI(config: TestConfig(url: ""))) }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        do {
            let service: TestService = get()!
            service.run()
        } catch {
            XCTFail()
        }
    }
    
    func testExplicitTypeIsResolved() throws {
        let testModule = module {
            singleton { () -> TestService in
                return TestServiceLive(repository: get()!)
            }
            singleton { TestRepository(api: TestAPI(config: TestConfig(url: ""))) }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        do {
            let service: TestService = get()!
            service.run()
        } catch {
            XCTFail()
        }
    }

    func testCircularDependencyIsResolved() throws {
        var testModule = module {
            singleton { Parent(child: get()!) }
                .onInit {
                    guard let parent: Parent = $0 as? Parent else { fatalError() }
                    let child: Child = get()!
                    child.parent = parent
                }
            singleton { Child() }
        }
        injectSyringe {
            modules {
                testModule
            }
        }
        
        let parent: Parent = get()!
        let child: Child = get()!
        
        XCTAssert(child.parent != nil)
    }
    
    func testUnregisteredDependencyIsNull() throws {
        var testModule = module {
            singleton { Parent(child: get()!) }
                .onInit {
                    guard let parent: Parent = $0 as? Parent else { fatalError() }
                    let child: Child = get()!
                    child.parent = parent
                }
            singleton { Child() }
        }
        injectSyringe {
            modules {
                testModule
            }
        }
        
        guard let service: TestService = get() else {
            return
        }
        
        XCTFail()
    }
}
