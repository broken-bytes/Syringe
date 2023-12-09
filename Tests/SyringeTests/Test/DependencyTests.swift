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

    override func tearDownWithError() throws {
        cleanSyringe()
    }
    
    func testTypeCastingIsResolved() throws {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let service: TestService = get() else {
            XCTFail()
            return
        }
        
        service.run()
        
    }
    
    func testExplicitTypeIsResolved() throws {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let service: TestServiceLive = get() else {
            XCTFail()
            return
        }
        
        service.run()
    }

    func testCircularDependencyIsResolved() throws {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let parent: Parent = get() else {
            XCTFail()
            return
        }
        guard let child: Child = get() else {
            XCTFail()
            return
        }
                
        XCTAssert(child.parent != nil)
    }
    
    func testUnregisteredDependencyIsNull() throws {
        defer {
            cleanSyringe()
        }
        
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
        
        guard let service: TestService = get() else {
            cleanSyringe()
            return
        }
        
        service.run()
        
        XCTFail()
    }
}
