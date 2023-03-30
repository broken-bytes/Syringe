/**
 * View+Extension.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 30th 2023, 8:59:02 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation
import SwiftUI
import Syringe

@propertyWrapper
public struct Injected<T> {
    public var wrappedValue: T {
        guard let value: T = inject() else {
            fatalError("Dependency \(T.self) not registered globally")
        }
        
        return value
    }
    
    public init() {
    }
}

public extension View {
    
    func withSyringe(_ block: () -> [Module]) -> some View {
        injectSyringe {
            block()
        }
        
        return self
    }
    
    func withSyringe(logger: SyringeLogger, _ block: () -> [Module]) -> some View {
        injectSyringe {
            logger
            block()
        }
        
        return self
    }
}

