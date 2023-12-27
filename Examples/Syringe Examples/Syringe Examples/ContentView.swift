//
//  ContentView.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 30.03.23.
//

import Observation
import SwiftUI
import Syringe

struct ContentView: View {
    @Injected(name: "") var value: Int
    @State var viewModel: ContentViewModel = get()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, \(viewModel.username)! Your ID is: \(value)")
        }
        .padding()
    }
}
