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
struct Injected<T> {
    var wrappedValue: T {
        guard let value: T = inject() else {
            fatalError("Dependency \(T.self) not registered globally")
        }
        
        return value
    }
    
    init() {
    }
}

extension View {
    
    func withSyringe(_ block: () -> [Module]) -> some View {
        self.environmentObject(
            syringeContainer {
                block()
        })
    }
    
    func withSyringe(logger: SyringeLogger, _ block: () -> [Module]) -> some View {
        self.environmentObject(
            syringeContainer {
                logger
                block()
        })
    }
}

struct TestView: View {
    @Injected var value: Int
    
    var body: some View {
        VStack {
            
        }
        .withSyringe {
            modules {
                module {
                    factory { _ in Int.random(in: 0..<5) }
                    factory { _ in Int.random(in: 0..<5) }
                }
            }
        }
        .onAppear {
            print(self.value)
        }
    }
}

