/**
 * ContainerKey.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

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
