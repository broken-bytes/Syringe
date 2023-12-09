//
//  LoggerTests.swift
//  
//
//  Created by Marcel Kulina on 31.03.23.
//

import XCTest
@testable import Syringe


final class LoggerTests: XCTestCase {
    
    override class func tearDown() {
        cleanSyringe()
    }
    
    func testLoggerDisplaysWarningWhenRegisteringContainerTwice() {
        defer {
            cleanSyringe()
        }
        
        let key = "Key"
        let expectation = XCTestExpectation()
        registerContainer(key: key) {
            logger {
                print("\($0)\($1)")
                switch $0 {
                case .warn:
                    switch $1 {
                    case .registerContainer(let message):
                        expectation.fulfill()
                    default:
                        XCTFail()
                    }
                default:
                    XCTFail()
                }
            }
            modules {
                
            }
        }
        
        registerContainer(key: key) {
            modules {
                
            }
        }
        
        wait(for: [expectation], timeout: 2)
    }
}
