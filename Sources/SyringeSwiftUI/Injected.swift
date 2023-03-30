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
    
    public var wrappedValue: T {
        guard let value: T = container != nil ? container?.get() : inject() else {
            fatalError("Failed to find dependency \(T.self)")
        }
        
        return value
    }
    
    
    public init(with key: any Hashable) {
        self.container = Syringe.container(for: key)
    }
    
    public init() {
        self.container = nil
    }
}

