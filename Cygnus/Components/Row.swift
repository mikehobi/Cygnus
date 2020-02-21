//
// Row.swift
// 2020 Instrument Marketing
//

import UIKit

public class Row: View {
    override func setupDefaults() {
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
    }
}
