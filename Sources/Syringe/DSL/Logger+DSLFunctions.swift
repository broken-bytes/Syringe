/**
 * Logger+DSLFunctions.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public func logger(_ logger: @escaping SyringeLogMessage) -> SyringeLogger {
    SyringeLogger(logFunc: logger)
}
