//
//  Text.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit
import BonMot
import SnapKit

public class Text: UILabel {
    var stringStyle: StringStyle!

    override public var text: String? {
        didSet {
            if let text = text {
                updateText(text)
            }
        }
    }

    public init(_ text: String, _ options: StringStyle.Part...) {
        super.init(frame: .zero)
        numberOfLines = 0
        backgroundColor = .clear

        stringStyle = StringStyle(options)
        attributedText = text.styled(with: stringStyle)
    }

    public init(_ text: String, style: StringStyle) {
        super.init(frame: .zero)
        numberOfLines = 0
        backgroundColor = .clear

        attributedText = text.styled(with: style)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateText(_ text: String) {
        attributedText = text.styled(with: stringStyle)
    }
}
