//
//  UIImage.swift
//  Cygnus
//
//  Created by Mike Hobizal on 3/10/20.
//  Copyright © 2020 Mike Hobizal. All rights reserved.
//

import UIKit

internal extension UIImage {
    func getRatio() -> CGFloat {
        return self.size.height / self.size.width
    }
}
