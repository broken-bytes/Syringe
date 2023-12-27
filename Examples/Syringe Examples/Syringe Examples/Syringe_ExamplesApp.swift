//
//  Syringe_ExamplesApp.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 30.03.23.
//

import SwiftUI
import Syringe

@main
struct Syringe_ExamplesApp: App {
    init() {
        injectSyringe {
            modules {
                module {
                    factory { _ in
                        Int.random(in: 0..<5)
                    }
                    factory { _ in
                        ContentViewModel(username: "Marcel")
                    }
                }
            }
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
