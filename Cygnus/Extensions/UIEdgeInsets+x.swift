//
//  UIEdgeInsets+x.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    // Returns a padding that offsets one or more sides
    func offsettedBy(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        return UIEdgeInsets(top: self.top + top,
                            left: self.left + left,
                            bottom: self.bottom + bottom,
                            right: self.right + right)
    }

    // Returns a padding that overrides one or more sides
    func overriddenBy(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) -> UIEdgeInsets {
        return UIEdgeInsets(top: top ?? self.top,
                            left: left ?? self.left,
                            bottom: bottom ?? self.bottom,
                            right: right ?? self.right)
    }

    static func horizontal(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: padding,
                            bottom: 0,
                            right: padding)
    }

    static func vertical(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding,
                            left: 0,
                            bottom: padding,
                            right: 0)
    }

    static func all(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding,
                            left: padding,
                            bottom: padding,
                            right: padding)
    }

    static func all(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: top,
                            left: left,
                            bottom: right,
                            right: bottom)
    }

    // TOP
    static func top(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding,
                            left: 0,
                            bottom: 0,
                            right: 0)
    }

    // LEFT
    static func left(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: padding,
                            bottom: 0,
                            right: 0)
    }

    // RIGHT
    static func right(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: 0,
                            right: padding)
    }

    // BOTTOM
    static func bottom(_ padding: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,
                            left: 0,
                            bottom: padding,
                            right: 0)
    }
}
