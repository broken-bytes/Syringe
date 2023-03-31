/**
 * Injected.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 30th 2023, 10:32:05 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation
import Syringe

@propertyWrapper
public struct Injected<T> {
    private let container: Container?
    private let needsContainer: Bool
    
    public var wrappedValue: T {
        if needsContainer {
            guard let value: T = container?.get() else {
                fatalError("Failed to find dependency in container \(String(describing: container))")
            }
            
            return value
        }
        
        guard let value: T = container != nil && needsContainer ? container?.get() : inject() else {
            fatalError("Failed to find dependency \(T.self)")
        }
        
        return value
    }
    
    
    public init(with key: any Hashable) {
        self.container = Syringe.container(for: key)
        self.needsContainer = true
    }
    
    public init() {
        self.container = nil
        self.needsContainer = false
    }
}

