//
// UIEdgeInsets+.swift
// 2020 Instrument Marketing
//

import UIKit.UIGeometry

public extension UIEdgeInsets {

    enum Part {
        case all(_ value: CGFloat)
        case top(_ value: CGFloat)
        case left(_ value: CGFloat)
        case right(_ value: CGFloat)
        case bottom(_ value: CGFloat)
        case horizontal(_ value: CGFloat)
        case vertical(_ value: CGFloat)
    }

    init(_ insets: Part...) {
        self.init()
        top = 0
        left = 0
        right = 0
        bottom = 0
        for inset in insets {
            switch inset {
            case let .all(value):
                top = value
                left = value
                right = value
                bottom = value
            case let .horizontal(value):
                left = value
                right = value
            case let .vertical(value):
                top = value
                bottom = value
            case let .top(value):
                top = value
            case let .left(value):
                left = value
            case let .right(value):
                right = value
            case let .bottom(value):
                bottom = value
            }
        }
    }

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

}
