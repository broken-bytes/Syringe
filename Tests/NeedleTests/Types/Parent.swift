/**
 * NeedleApplication.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public class Parent {
    
    public let child: Child
    
    public init(child: Child) {
        self.child = child
    }
}
