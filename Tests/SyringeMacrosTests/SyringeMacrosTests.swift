import XCTest
@testable import SyringeMacro

class SyringeMacroTests: XCTest {
    let testMacros: [String: Macro.Type] = [
        "Injected": InjectedMacro.self
    ]
    func testInjectedMacro() {
        assertMacroExpansion(
            #"""
            @Injected var viewModel: ViewModel
            """#,
            expandedSource: #"""
            var viewModel: ViewModel {
                get {
                    fatalError("Injected property not implemented")
                }
                set {
                    fatalError("Injected property not implemented")
                }
            }
            """#,
            diagnostics: [
                
            ],
            macros: testMacros
        )
    }
}