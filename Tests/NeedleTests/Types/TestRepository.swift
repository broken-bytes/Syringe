/**
 * TestRepository.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

class TestRepository {

    let api: TestAPI
   
    public init(api: TestAPI) {
        self.api = api
    }
    
    public func run() {
        print("Test hasb een called on repository")
        api.run()
    }
}
