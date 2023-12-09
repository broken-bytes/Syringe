//
//  ContainerKey.swift
//  
//
//  Created by Marcel Kulina on 30.03.23.
//

import Foundation

public struct ContainerKey: Hashable {
    
    let key: any Hashable
    
    public init(key: any Hashable) {
        self.key = key
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
    
    public static func == (lhs: ContainerKey, rhs: ContainerKey) -> Bool {
        lhs.key.hashValue == rhs.key.hashValue
    }
    
}
