//
//  Button.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import BonMot
import UIKit

public struct ButtonOptions {
    public var color: UIColor?
    public var height: CGFloat?
    public var borderColor: UIColor?
    public var backgroundColor: UIColor?
    public var padding: UIEdgeInsets?
    public var titleStyle: StringStyle?

    public enum Part {
        case color(UIColor)
        case height(CGFloat)
        case borderColor(UIColor)
        case backgroundColor(UIColor)
        case padding(UIEdgeInsets)
        case titleStyle(StringStyle)
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
        case let .color(color):
            self.color = color
        case let .borderColor(borderColor):
            self.borderColor = borderColor
        case let .backgroundColor(backgroundColor):
            self.backgroundColor = backgroundColor
        case let .padding(padding):
            self.padding = padding
        case let .height(height):
            self.height = height
        case let .titleStyle(titleStyle):
            self.titleStyle = titleStyle
        }
    }

    public func updateOptions(_ parts: Part...) -> ButtonOptions {
        return updateOptions(parts)
    }

    public func updateOptions(_ parts: [Part]) -> ButtonOptions {
        var options = self
        for part in parts {
            options.update(part: part)
        }
        return options
    }
}

class Button: UIButton {
    typealias SelfClosure = ((UIButton) -> Void)?

    static let DefaultButtonOptions: ButtonOptions = ButtonOptions([
        .height(60),
        .color(.black),
        .borderColor(.clear),
        .backgroundColor(.white),
    ])

    var title: String? {
        didSet {
            if let title = title {
                updateTitle(title)
            }
        }
    }

    var buttonOptions: ButtonOptions!

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.8 : 1
        }
    }

    init(_ title: String? = nil, image: UIImage? = nil, options: [ButtonOptions.Part]? = nil, closure: SelfClosure = nil) {
        super.init(frame: .zero)

        if let image = image {
            setImage(image, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        }

        self.title = title

        if let options = options {
            buttonOptions = Button.DefaultButtonOptions.updateOptions(options)
            applyOptions(buttonOptions)
        } else {
            applyOptions(Button.DefaultButtonOptions)
            buttonOptions = Button.DefaultButtonOptions
        }

        closure?(self)
    }

    convenience init(_ title: String) {
        self.init(title, image: nil, options: nil)
    }

    init(_ title: String? = nil, image: UIImage? = nil, style: ButtonOptions? = nil, closure: SelfClosure = nil) {
        super.init(frame: .zero)

        if let image = image {
            setImage(image, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        }

        self.title = title

        if let style = style {
            buttonOptions = style
            applyOptions(style)
        }

        closure?(self)
    }

    func applyOptions(_ buttonOptions: ButtonOptions) {
        var attributedTitle: NSAttributedString?
        let baseStyle = StringStyle(.font(.systemFont(ofSize: 16)), .tracking(.adobe(0.34)))
        if let titleStyle = buttonOptions.titleStyle {
            if let color = buttonOptions.color {
                attributedTitle = title?.styled(with: titleStyle, .color(color))
            } else {
                attributedTitle = title?.styled(with: titleStyle)
            }
        } else if let color = buttonOptions.color {
            attributedTitle = title?.styled(with: baseStyle, .color(color))
        }
        setAttributedTitle(attributedTitle, for: .normal)

        if let backgroundColor = buttonOptions.backgroundColor {
            self.backgroundColor = backgroundColor
        }
        if let borderColor = buttonOptions.borderColor {
            layer.borderWidth = 1
            layer.borderColor = borderColor.cgColor
        }
        if let padding = buttonOptions.padding {
            contentEdgeInsets = padding
        }
        if let height = buttonOptions.height {
            snp.makeConstraints { make in
                make.height.equalTo(height)
            }
            layer.cornerRadius = height / 2
        }
    }

    private func updateTitle(_ title: String) {
        let attributedTitle = title.styled(with: .font(.systemFont(ofSize: 16)), .tracking(.adobe(0.34)), .color(buttonOptions.color!))
        setAttributedTitle(attributedTitle, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
