/**
 * ContainerTests.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */
import Foundation


import XCTest
@testable import Syringe

final class ContainerTests: XCTestCase {
    
    override func tearDownWithError() throws {
        cleanSyringe()
    }
    
    func testGlobalScopeIsCreated() throws {
        let testModule = module {
            singleton { _ in TestConfig(url: "") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        // Config should not be nil
        let config: TestConfig? = inject()
        
        XCTAssertNotNil(config)
    }
    
    func testGlobalScopeIsShutdown() throws {
        defer {
            cleanSyringe()
        }
        
        let testModule = module {
            singleton { _ in TestConfig(url: "TEST") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        cleanSyringe()
        
        guard let config: TestConfig = inject() else {
            // Else case is what we want so return here
            return
        }
        
        XCTFail()
    }
    
    func testLoggerWorks() throws {
        defer {
            cleanSyringe()
        }
        
        let testModule = module {
            singleton { _ in TestConfig(url: "") }
        }
        
        injectSyringe {
            logger { print("Level: \($0) Message: \($1)")}
            modules {
                testModule
            }
        }
        
        guard let config: TestConfig = inject() else {
            // Else clase is what we want so return here
            return
        }
    }
    
    func testRegisteredContainerIsAvailable() {
        let containerKey = "Container"
        defer {
            cleanSyringe()
            removeContainer(for: containerKey)
        }
        
        let randomVal = Int.random(in: 0..<5)
        registerContainer(key: containerKey) {
            modules {
                module {
                    singleton { Module in
                        randomVal
                    }
                }
            }
        }
        
        let container = findContainer(for: containerKey)
        
        XCTAssertNotNil(container)
        XCTAssert(randomVal == container?.get())
    }
    
    func testRegisteredContainerCanBeUnregistered() {
        let containerKey = "Container"

        defer {
            cleanSyringe()
        }
        
        let randomVal = Int.random(in: 0..<5)
        registerContainer(key: containerKey) {
            modules {
                module {
                    singleton { Module in
                        randomVal
                    }
                }
            }
        }
        
        var container = findContainer(for: containerKey)
        
        XCTAssertNotNil(container)
        XCTAssert(randomVal == container?.get())
        
        removeContainer(for: containerKey)
        
        container = Syringe.findContainer(for: containerKey)
        
        XCTAssertNil(container)
    }
    
    func testRegisteringTheSameKeyTwicePreventsOverrides() {
        let containerKey = "Key"
        defer {
            cleanSyringe()
            removeContainer(for: containerKey)
        }
        

        registerContainer(key: containerKey) {
            modules {
            }
        }
        
        let containerA = findContainer(for: containerKey)
        
        registerContainer(key: containerKey) {
            modules {
            }
        }
        
        let containerB = findContainer(for: containerKey)
        
        XCTAssertIdentical(containerA, containerB)
    }
}
