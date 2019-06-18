//
//  UIStackView+addArrangedSubviews.swift
//  ncx
//
//  Created by Mike Hobizal on 3/12/19.
//  Copyright © 2019 Mike Hobizal. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
