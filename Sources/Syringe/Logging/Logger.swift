/**
 * Logger.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public typealias SyringeLogMessage = (SyringeLogLevel, SyringeLogAction) -> Void

public class SyringeLogger {
    
    private let logFunc: SyringeLogMessage
    
    internal init(logFunc: @escaping SyringeLogMessage) {
        self.logFunc = logFunc
    }
    
    internal func log(level: SyringeLogLevel, message: SyringeLogAction) {
        logFunc(level, message)
    }
}
