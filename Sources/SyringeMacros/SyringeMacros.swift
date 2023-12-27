import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct SyringeMacros: CompilerPlugin {
    var providingMacros: [Macro.Type] = [InjectedMacro.self]
}
