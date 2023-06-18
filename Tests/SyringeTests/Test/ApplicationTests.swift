/**
 * ApplicationTests.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */
import Foundation


import XCTest
@testable import Syringe

final class TestApplication: XCTestCase {
    
    override func setUpWithError() throws {
        let testModule = module {
            singleton { _ in TestConfig(url: "") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
    }
    
    func testGlobalScopeIsCreated() throws {
        
        // Config should not be nil
        let config: TestConfig? = get()
        
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
        
        guard let config: TestConfig = get() else {
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
        
        guard let config: TestConfig = get() else {
            // Else clase is what we want so return here
            return
        }
    }
}
