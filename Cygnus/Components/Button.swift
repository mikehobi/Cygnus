//
// Button.swift
// 2020 Instrument Marketing
//

import BonMot
import UIKit

public class Button: UIButton {
    public struct Options {
        public var color: UIColor?
        public var height: CGFloat?
        public var borderColor: UIColor?
        public var backgroundColor: UIColor?
        public var blur: UIBlurEffect.Style?
        public var padding: UIEdgeInsets?
        public var titleStyle: StringStyle?

        public enum Part {
            case color(UIColor)
            case height(CGFloat)
            case borderColor(UIColor)
            case backgroundColor(UIColor)
            case blur(UIBlurEffect.Style)
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
            case let .blur(blur):
                self.blur = blur
            case let .padding(padding):
                self.padding = padding
            case let .height(height):
                self.height = height
            case let .titleStyle(titleStyle):
                self.titleStyle = titleStyle
            }
        }

        public func updateOptions(_ parts: Part...) -> Options {
            return updateOptions(parts)
        }

        public func updateOptions(_ parts: [Part]) -> Options {
            var options = self
            for part in parts {
                options.update(part: part)
            }
            return options
        }
    }

    public enum ButtonStyle {
        case dark
        case light
        case translucent

        func getOptions() -> Button.Options {
            switch self {
            case .dark:
                return Options([
                    .backgroundColor(.black),
                    .color(.white),
                    .borderColor(.clear),
                    .height(50),
                    .padding(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)),
                ])
            case .light:
                return Options([
                    .backgroundColor(.white),
                    .color(.black),
                    .borderColor(.clear),
                    .height(50),
                    .padding(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)),
                ])
            case .translucent:
                return Options([
                    .backgroundColor(.clear),
                    .blur(.regular),
                    .color(.white),
                    .borderColor(.clear),
                    .height(50),
                    .padding(UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)),
                ])
            }
        }
    }

    static let DefaultButtonOptions: Options = Options([
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

    var buttonOptions: Options

    override public var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.8 : 1
        }
    }

    private var blurView: UIVisualEffectView?

    public init(_ title: String? = nil, image: UIImage? = nil, with options: [Options.Part]? = nil) {
        if let options = options {
            buttonOptions = Options(options)
        } else {
            buttonOptions = Button.DefaultButtonOptions
        }

        super.init(frame: .zero)

        if let image = image {
            setImage(image, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        }

        self.title = title
        applyOptions(buttonOptions)
    }

    convenience public init(_ title: String) {
        self.init(title, image: nil, with: nil)
    }

    public init(_ title: String? = nil, image: UIImage? = nil, style: ButtonStyle? = .dark) {
        if let style = style {
            buttonOptions = style.getOptions()
        } else {
            buttonOptions = Button.DefaultButtonOptions
        }

        super.init(frame: .zero)

        if let image = image {
            setImage(image, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        }

        self.title = title
        applyOptions(buttonOptions)
    }

    public init(_ title: String? = nil, image: UIImage? = nil, options: Button.Options) {
        buttonOptions = options

        super.init(frame: .zero)

        if let image = image {
            setImage(image, for: .normal)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
        }

        self.title = title

        applyOptions(options)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyOptions(_ buttonOptions: Options) {
        var attributedTitle: NSAttributedString?
        let baseStyle = StringStyle(.font(.systemFont(ofSize: 16)), .tracking(.point(0.34)))
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
            clipsToBounds = true
        }
        if let blur = buttonOptions.blur {
            if let blurView = self.blurView {
                blurView.removeFromSuperview()
            }
            blurView = UIVisualEffectView(effect: UIBlurEffect(style: blur))
            guard let blurView = blurView else {
                return
            }
            blurView.isUserInteractionEnabled = false
            insertSubview(blurView, at: 0)
            blurView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
        }
    }

    func update(_ text: String, style: ButtonStyle) {
        buttonOptions = style.getOptions()
        applyOptions(buttonOptions)
        updateTitle(text)
    }

    private func updateTitle(_ title: String) {
        if let titleStyle = buttonOptions.titleStyle {
            if let color = buttonOptions.color {
                let attributedTitle = title.styled(with: titleStyle, .color(color))
                setAttributedTitle(attributedTitle, for: .normal)
            } else {
                let attributedTitle = title.styled(with: titleStyle)
                setAttributedTitle(attributedTitle, for: .normal)
            }
            return
        }
        if let color = buttonOptions.color {
            let attributedTitle = title.styled(
                with: .font(.systemFont(ofSize: 16)),
                .tracking(.adobe(0.34)),
                .color(color))
            setAttributedTitle(attributedTitle, for: .normal)
        } else {
            let attributedTitle = title.styled(
                with: .font(.systemFont(ofSize: 16)),
                .tracking(.adobe(0.34)),
                .color(.black))
            setAttributedTitle(attributedTitle, for: .normal)
        }
    }

    public func addTap(target: Any?, action: Selector) -> Button {
        addTarget(target, action: action, for: .touchUpInside)
        return self
    }
}
