//
//  ContentView.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 30.03.23.
//

import SwiftUI
import Syringe

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
