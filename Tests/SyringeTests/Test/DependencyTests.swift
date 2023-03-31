/**
 * DependencyTests.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import XCTest
@testable import Syringe

final class DependencyTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTypeCastingIsResolved() throws {
        let testModule = module {
            singleton { (module: Module) -> TestService in
                TestServiceLive(repository: module.get()!) as TestService
            }
            singleton { _ in TestRepository(api: TestAPI(config: TestConfig(url: ""))) }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        guard let service: TestService = inject() else {
            XCTFail()
            return
        }
        
        service.run()
        
    }
    
    func testExplicitTypeIsResolved() throws {
        let testModule = module {
            singleton { module in
                return TestServiceLive(repository: module.get()!)
            }
            singleton { _ in TestRepository(api: TestAPI(config: TestConfig(url: ""))) }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        guard let service: TestServiceLive = inject() else {
            XCTFail()
            return
        }
        service.run()
    }

    func testCircularDependencyIsResolved() throws {
        let testModule = module {
            singleton { module in Parent(child: module.get()!) }
                .onInit {
                    guard let parent: Parent = $1 as? Parent else { fatalError() }
                    // TODO: Change to get
                    let child: Child = $0.get()!
                    child.parent = parent
                }
            singleton { _ in Child() }
        }
        injectSyringe {
            modules {
                testModule
            }
        }
        
        guard let parent: Parent = inject() else {
            XCTFail()
            return
        }
        guard let child: Child = inject() else {
            XCTFail()
            return
        }
        
        XCTAssert(child.parent != nil)
    }
    
    func testUnregisteredDependencyIsNull() throws {
        let testModule = module {
            singleton { module in Parent(child: module.get()!) }
                .onInit {
                    guard let parent: Parent = $1 as? Parent else { fatalError() }
                    // TODO: Change to get
                    let child: Child = $0.get()!
                    child.parent = parent
                }
            singleton { _ in Child() }
        }
        injectSyringe {
            modules {
                testModule
            }
        }
        
        guard let service: TestService = inject() else {
            return
        }
        
        service.run()
        
        XCTFail()
    }
}
