//
//  UIImage+sizeToSuperview.swift
//  nike-mx
//
//  Created by Thomas Bruketta on 10/22/18.
//  Copyright © 2018 Instrument Marketing. All rights reserved.
//

import UIKit
import SnapKit

extension UIImageView {
    
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
