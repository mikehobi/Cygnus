//
//  View.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit

class Row: View {
    override func setupDefaults() {
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 0
    }
}
