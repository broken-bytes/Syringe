import XCTest
import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import SwiftSyntax

#if canImport(SyringeMacros)
import SyringeMacros
#endif

class SyringeMacroTests: XCTestCase {
    let testMacros: [String: Macro.Type] = [
        "Injected": InjectedMacro.self
    ]
    
    func testInjectedMacro() {
        assertMacroExpansion(
            #"""
            @Injected var viewModel: ViewModel
            """#, 
            expandedSource:  
            #"""
            var viewModel: ViewModel {
                get {
                    get()
                }
            }
            """#,
            macros: testMacros)
    }
}
