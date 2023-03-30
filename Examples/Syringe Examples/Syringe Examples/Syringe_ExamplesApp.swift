//
//  Syringe_ExamplesApp.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 30.03.23.
//

import SwiftUI
import Syringe
import SyringeSwiftUI

@main
struct Syringe_ExamplesApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }
            .withSyringe {
                modules {
                    module {
                        factory { _ in
                            Int.random(in: 0..<5)
                        }
                    }
                }
            }
            .onAppear {
                registerContainer(key: "Container", container: syringeContainer {
                    modules {
                        module {
                            singleton { _ in 3 }
                        }
                    }
                })
            }
        }
    }
}
