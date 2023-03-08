/**
 * Logger.swift | Part of the needle dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public typealias NeedleLogMessage = (NeedleLogLevel, NeedleLogAction) -> Void

public class NeedleLogger {
    
    internal init(logFunc: @escaping NeedleLogMessage) {
        
    }
}

public func logger(_ logger: @escaping NeedleLogMessage) -> NeedleLogger {
    NeedleLogger(logFunc: logger)
}
