//
//  View.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit
import SnapKit

public struct ViewOptions {
    public var backgroundColor: UIColor?
    public var axis: NSLayoutConstraint.Axis?
    public var padding: UIEdgeInsets?
    public var spacing: CGFloat?
    public var distribution: UIStackView.Distribution?
    public var alignment: UIStackView.Alignment?

    public enum Part {
        case backgroundColor(UIColor)
        case axis(NSLayoutConstraint.Axis)
        case padding(UIEdgeInsets)
        case spacing(CGFloat)
        case distribution(UIStackView.Distribution)
        case alignment(UIStackView.Alignment)
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
        case let .distribution(distribution):
            self.distribution = distribution
        case let .alignment(alignment):
            self.alignment = alignment
        }
    }

    public func updateOptions(_ parts: Part...) -> ViewOptions {
        return updateOptions(parts)
    }

    public func updateOptions(_ parts: [Part]) -> ViewOptions {
        var options = self
        for part in parts {
            options.update(part: part)
        }
        return options
    }
}

public class View: UIView {
    let stack = UIStackView()

     public init(_ views: [UIView], options: [ViewOptions.Part]? = nil) {
        super.init(frame: .zero)

        addSubview(stack)
        for view in views {
            stack.addArrangedSubview(view)
        }

        setupDefaults()

        stack.snp.makeConstraints { $0.edges.equalToSuperview() }

        if let options = options {
            let viewOptions = ViewOptions(options)
            applyOptions(viewOptions)
        }
    }

    public convenience init(_ view: UIView, options: [ViewOptions.Part]? = nil) {
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

        if let distribution = viewOptions.distribution {
            stack.distribution = distribution
        }

        if let alignment = viewOptions.alignment {
            stack.alignment = alignment
        }

        if let padding = viewOptions.padding {
            stack.snp.remakeConstraints { make in
                make.edges.equalToSuperview().inset(padding)
            }
        }
    }

    required init(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
