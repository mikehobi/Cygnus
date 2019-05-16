//
//  View.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit
import BonMot

public struct ButtonOptions {
    public var backgroundColor: UIColor?
    public var titleStyle: [StringStyle.Part]?
    public var padding: UIEdgeInsets?
    
    public enum Part {
        case backgroundColor(UIColor)
        case titleStyle([StringStyle.Part])
        case padding(UIEdgeInsets)
    }
    
    public init(_ parts: Part...) {
        self.init(parts)
    }
    
    public init(_ parts: [Part]) {
        self.init()
        for part in parts {
            update(part: part)
        }
    }
    public init() {}
    
    mutating func update(part stylePart: Part) {
        switch stylePart {
        case let .backgroundColor(backgroundColor):
            self.backgroundColor = backgroundColor
        case let .titleStyle(titleStyle):
            self.titleStyle = titleStyle
        case let .padding(padding):
            self.padding = padding
        }
    }
}

class Button: UIButton {
    
    var title: String?
    init(_ title: String, options: [ButtonOptions.Part], closure: ((UIButton) -> Void)? = nil) {
        super.init(frame: .zero)

        setupDefaults()
        
        self.title = title
        
        let buttonOptions = ButtonOptions(options)
        self.applyOptions(buttonOptions)
        
        // WEIRD
        closure?(self)
    }
    
    func setupDefaults() {
    }
    
    func applyOptions(_ buttonOptions: ButtonOptions) {
        if let backgroundColor = buttonOptions.backgroundColor {
            self.backgroundColor = backgroundColor
        }

        if let padding = buttonOptions.padding {
            self.contentEdgeInsets = padding
        }
        
        if let titleStyle = buttonOptions.titleStyle,
            let title = title {
            let style = StringStyle(titleStyle)
            self.setAttributedTitle(title.styled(with: style), for: .normal)
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
