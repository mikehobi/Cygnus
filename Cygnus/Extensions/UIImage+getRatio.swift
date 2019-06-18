//
//  UIImage+getRatio.swift
//  NikeOmegaSwift
//
//  Created by Mike Hobizal on 2/1/18.
//  Copyright © 2018 Instrument Marketing. All rights reserved.
//

import UIKit

extension UIImage {
    
    func getRatio() -> CGFloat {
        return self.size.height / self.size.width
    }

}
