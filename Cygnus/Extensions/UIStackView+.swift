//
//  UIStackView+.swift
//  Cygnus
//
//  Created by Mike Hobizal on 3/10/20.
//  Copyright © 2020 Mike Hobizal. All rights reserved.
//

import UIKit

internal extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
