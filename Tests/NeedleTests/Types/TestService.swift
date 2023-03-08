/**
 * TestService.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */


import Foundation

protocol TestService {
    func run()
}

class TestServiceLive: TestService {
    
    let repository: TestRepository
    
    public init(repository: TestRepository) {
        self.repository = repository
    }
    
    public func run() {
        print("Test has been called on service Live")
        repository.run()
    }
}

class TestServiceMock: TestService {
    
    let repository: TestRepository
    
    public init(repository: TestRepository) {
        self.repository = repository
    }
    
    public func run() {
        print("Test has been called on service Mock")
        repository.run()
    }
}

