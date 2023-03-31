/**
 * LogAction.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

/// The log actions for SyringeLogger
public enum SyringeLogAction {
    
    /// Syringe was started
    case startSyringe(message: String)
    /// A resolvable was registered
    case register(factory: any Resolvable)
    /// A resolvable was resolved
    case resolve(type: Any.Type)
    /// Syringe was ended
    case endSyringe(message: String)
    /// A container was registered
    case registerContainer(message: String)
    /// A container was removed
    case removeContainer(message: String)
}
