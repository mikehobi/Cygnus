//
//  UIImageView+.swift
//  Cygnus
//
//  Created by Mike Hobizal on 3/10/20.
//  Copyright © 2020 Mike Hobizal. All rights reserved.
//

import UIKit

internal extension UIImageView {

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
