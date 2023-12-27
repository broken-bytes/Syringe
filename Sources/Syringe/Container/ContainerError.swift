/**
 * ContainerError.swift | Part of the Syringe dependency injection framework
 * Created Date: Saturday, March 4th 2023, 8:58:20 pm
 * Author: Marcel Kulina
 *
 * Copyright (c) 2023 Marcel Kulina @brokenbytes
 */

import Foundation

public enum ContainerError: Error {
    case resolvableNotFound(named: String?)
    case resolvableArgsMismatch(named: String?)
}
