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
            singleton { TestConfig(url: "") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
    }
    
    func testGlobalScopeIsCreated() throws {
        
        
        var config: TestConfig = get()!
    }
    
    func testGlobalScopeIsShutdown() throws {
        let testModule = module {
            singleton { TestConfig(url: "") }
        }
        
        injectSyringe {
            modules {
                testModule
            }
        }
        
        stopSyringe()
        
        guard let config: TestConfig = get() else {
            // Else clase is what we want so return here
            return
        }
        
        XCTFail()
    }
    
    func testLoggerWorks() throws {
        let testModule = module {
            singleton { TestConfig(url: "") }
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
