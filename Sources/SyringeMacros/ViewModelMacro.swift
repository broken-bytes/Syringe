//
//  ViewModelMacro.swift
//
//
//  Created by Marcel Kulina on 27.12.23.
//

import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public struct ViewModelMacro: AccessorMacro {
    public static func expansion(of node: AttributeSyntax, providingAccessorsOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [AccessorDeclSyntax] {
        guard let prop = declaration.as(VariableDeclSyntax.self) else {
            throw SyringeMacroError.badType("Injected macro can only be applied to properties")
        }

        let name = prop.bindings.first?.pattern.description.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        print(name)

        return [
            AccessorDeclSyntax(stringLiteral: "get { get() }")
        ]
    }
}
