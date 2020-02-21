//
// Col.swift
// 2020 Instrument Marketing
//

import UIKit

public class Col: View {
    override func setupDefaults() {
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 0
    }
}
