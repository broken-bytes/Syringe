//
//  ContentView.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 30.03.23.
//

import SwiftUI
import Syringe
import SyringeSwiftUI

struct ContentView: View {
    @Injected var value: Int
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            print(self.value)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
