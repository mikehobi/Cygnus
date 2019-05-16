//
//  Text.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit
import BonMot

class Text: UILabel {
    
    var stringStyle: StringStyle!

    override var text: String? {
        didSet {
            if let text = text {
                self.updateText(text)
            }
        }
    }
    
    init(_ text: String, _ options: StringStyle.Part...) {
        super.init(frame: .zero)
        self.numberOfLines = 0
        self.backgroundColor = .clear
        
        stringStyle = StringStyle(options)
        self.attributedText = text.styled(with: stringStyle)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateText(_ text: String) {
        self.attributedText = text.styled(with: stringStyle)
    }
    
}
