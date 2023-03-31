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
/// Allows to dynamically aquire dependencies
public struct Injected<T> {
    private let key: (any Hashable)!
    private let needsContainer: Bool
    
    public var wrappedValue: T? {
        if needsContainer {
            guard let value: T = findContainer(for: key)?.get() else {
                return nil
            }
            
            return value
        }
        
        guard let value: T = inject() else {
            return nil
        }
        
        return value
    }
    
    
    public init(with key: any Hashable) {
        self.key = key
        self.needsContainer = true
    }
    
    public init() {
        self.needsContainer = false
        self.key = nil
    }
}

