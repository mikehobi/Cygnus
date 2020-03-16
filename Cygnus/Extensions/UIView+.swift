//
//  UIView+.swift
//  Cygnus
//
//  Created by Mike Hobizal on 3/10/20.
//  Copyright © 2020 Mike Hobizal. All rights reserved.
//

import UIKit

internal extension UIView {
    func snapshot(bounds: CGRect? = nil) -> UIImageView {
        let renderBounds = bounds ?? self.bounds
        let renderer = UIGraphicsImageRenderer(bounds: renderBounds)
        let image = renderer.image { rendererContext in
            self.layer.render(in: rendererContext.cgContext)
        }
        return UIImageView(image: image)
    }
}
