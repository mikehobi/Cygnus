//
//  Image.swift
//  nike-mx
//
//  Created by Mike Hobizal on 6/11/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit

class Image: UIImageView {
    init(_ imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
    }

    public func adjustSize() {
        self.sizeToSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
