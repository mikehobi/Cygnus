//
//  Utilities.swift
//  Cygnus
//
//  Created by Mike Hobizal on 6/24/19.
//  Copyright © 2019 Mike Hobizal. All rights reserved.
//

import UIKit
import SnapKit

// EDGE INSETS
public extension UIEdgeInsets {
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

// IMAGE
public extension UIImage {
    func getRatio() -> CGFloat {
        return self.size.height / self.size.width
    }
}

public extension UIImageView {

    func sizeToSuperview() {

        guard let image = self.image else {
            return
        }

        self.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(self.snp.width).multipliedBy(image.getRatio())
        }
    }

    func sizeToSuperview(inset: CGFloat) {

        guard let image = self.image else {
            return
        }

        self.snp.makeConstraints { make in
            make.width.equalToSuperview().inset(inset)
            make.height.equalTo(self.snp.width).multipliedBy(image.getRatio())
        }
    }
}

// STACK VIEW
public extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
