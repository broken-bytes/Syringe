/**
 * ResolverParameters.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public struct ResolverParameters {
    
    private let params: [Any]
    
    internal init(params: [Any]) {
        self.params = params
    }
    
    public func get<T>() -> T {
        for param in params {
            if let param = param as? T {
                return param
            }
        }
        
        fatalError("Parameter of type \(T.self) was not found in parameters")
    }
}
