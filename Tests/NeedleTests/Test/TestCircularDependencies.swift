/**
 * TestCircularDependencies.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import XCTest
@testable import Needle

final class TestCircularDependencies: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCircularDependencyIsResolved() throws {
        var testModule = module {
            singleton { Parent(child: get()) }
            singleton { Child() }
                .onInit {
                    guard let child: Child = $0 as? Child else {
                        fatalError()
                    }
                    
                    let parent: Parent = get()
                    
                    child.parent = parent
                }
        }
        startNeedle {
            modules {
                testModule
            }
        }
        
        let parent: Parent = get()
        print(parent)
    }
}
