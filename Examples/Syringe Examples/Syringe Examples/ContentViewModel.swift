//
//  ContentViewModel.swift
//  Syringe Examples
//
//  Created by Marcel Kulina on 27.12.23.
//

import Observation

@Observable final class ContentViewModel {
    var username: String
    
    init(username: String) {
        self.username = username
    }
}
