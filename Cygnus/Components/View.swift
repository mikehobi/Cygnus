//
//  View.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit

public struct ViewOptions {
    public var backgroundColor: UIColor?
    public var axis: NSLayoutConstraint.Axis?
    public var padding: UIEdgeInsets?
    public var spacing: CGFloat?
    
    public enum Part {
        case backgroundColor(UIColor)
        case axis(NSLayoutConstraint.Axis)
        case padding(UIEdgeInsets)
        case spacing(CGFloat)
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
        case let .axis(axis):
            self.axis = axis
        case let .backgroundColor(backgroundColor):
            self.backgroundColor = backgroundColor
        case let .padding(padding):
            self.padding = padding
        case let .spacing(spacing):
            self.spacing = spacing
        }
    }
}

class View: UIView {
    
    let stack = UIStackView()
    
    init(_ views: [UIView], options: [ViewOptions.Part]) {
        super.init(frame: .zero)

        setupDefaults()
        
        self.addSubview(stack)
        for view in views {
            stack.addArrangedSubview(view)
        }
        
        let viewOptions = ViewOptions(options)
        self.applyOptions(viewOptions)
    }
    
    convenience init(_ view: UIView, options: [ViewOptions.Part]) {
        self.init([view], options: options)
    }
    
    func setupDefaults() {
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 0
    }
    
    func applyOptions(_ viewOptions: ViewOptions) {
        if let backgroundColor = viewOptions.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        
        if let axis = viewOptions.axis {
            stack.axis = axis
        }
        
        if let spacing = viewOptions.spacing {
            stack.spacing = spacing
        }
        
        if let padding = viewOptions.padding {
            stack.snp.remakeConstraints { make in
                make.edges.equalToSuperview().inset(padding)
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
