/**
 * TestAPI.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

class TestAPI {
    
    let config: TestConfig
    
    public init(config: TestConfig) {
        self.config = config
    }
    
    public func run() {
        print("Test has been called on API \(ObjectIdentifier(self))")
    }
}
