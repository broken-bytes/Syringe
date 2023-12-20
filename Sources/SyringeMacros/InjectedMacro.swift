import Foundation
import SwiftSyntax
import SwiftSyntaxMacros

public struct InjectedMacro: AccessorMacro {
    public static func expansion(of node: AttributeSyntax, providingAccessorsOf declaration: some DeclSyntaxProtocol, in context: some MacroExpansionContext) throws -> [AccessorDeclSyntax] {
        guard let prop = declaration as? VariableDeclSyntax else {
            throw SyringeMacroError.badType("Injected macro can only be applied to properties")
        }

        let name = prop.bindings.first?.pattern.description.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        print(name)

        return []
    }
}