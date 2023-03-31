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
        let testModule = module {
            singleton { _ in TestConfig(url: "TEST") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        stopSyringe()
        
        guard let config: TestConfig = inject() else {
            // Else case is what we want so return here
            return
        }
        
        XCTFail()
    }
    
    func testLoggerWorks() throws {
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
        let randomVal = Int.random(in: 0..<5)
        registerContainer(key: "Container", container: syringeContainer {
            modules {
                module {
                    singleton { Module in
                        randomVal
                    }
                }
            }
        })
        
        let container = container(for: "Container")
        
        XCTAssertNotNil(container)
        XCTAssert(randomVal == container?.get())
    }
    
    func testRegisteredContainerCanBeUnregistered() {
        let randomVal = Int.random(in: 0..<5)
        registerContainer(key: "Container", container: syringeContainer {
            modules {
                module {
                    singleton { Module in
                        randomVal
                    }
                }
            }
        })
        
        var container = container(for: "Container")
        
        XCTAssertNotNil(container)
        XCTAssert(randomVal == container?.get())
        
        removeContainer(for: "Container")
        
        container = Syringe.container(for: "Container")
        
        XCTAssertNil(container)
    }
    
    func testRegisteringTheSameKeyTwicePreventsOverrides() {
        let key = "Key"
        registerContainer(key: key, container: syringeContainer {
            modules {
            }
        })
        
        let containerA = container(for: key)
        
        registerContainer(key: key, container: syringeContainer {
            modules {
            }
        })
        
        let containerB = container(for: key)
        
        XCTAssertIdentical(containerA, containerB)
    }
}
