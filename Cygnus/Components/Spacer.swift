//
//  Spacer.swift
//  NikeOmegaSwift
//
//  Created by Thomas Bruketta on 10/31/18.
//  Copyright © 2018 Instrument Marketing. All rights reserved.
//

import UIKit

class Spacer: UIView {
    
    init(height: CGFloat? = nil, width: CGFloat? = nil) {
        super.init(frame: .zero)
        
        
        self.snp.makeConstraints{ make in
            if let height = height {
                make.height.equalTo(height)
            }

            if let width = width {
                make.width.equalTo(width)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
