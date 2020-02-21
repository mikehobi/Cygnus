//
// Text.swift
// 2020 Instrument Marketing
//

import BonMot
import UIKit

public class Text: UILabel {
    var stringStyle: StringStyle {
        didSet {
            if let text = text {
                updateText(text)
            }
        }
    }

    override var text: String? {
        didSet {
            if let text = text {
                updateText(text)
            }
        }
    }

    init(_ text: String, _ options: StringStyle.Part...) {
        stringStyle = StringStyle(options)
        super.init(frame: .zero)
        setup()
        attributedText = text.styled(with: stringStyle)
    }

    init(_ text: String, style: StringStyle) {
        stringStyle = style
        super.init(frame: .zero)
        setup()
        attributedText = text.styled(with: style)
    }

    private func setup() {
        numberOfLines = 0
        backgroundColor = .clear
        setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func updateText(_ text: String) {
        attributedText = text.styled(with: stringStyle)
    }

    var labelSnapshot: UIImageView?
    func updateStyle(_ options: StringStyle.Part...) {
        prepareStyleUpdate()
        stringStyle = stringStyle.byAdding(options)
        labelSnapshot?.alpha = 0
    }

    func prepareStyleUpdate() {
        labelSnapshot?.removeFromSuperview()
        labelSnapshot = snapshot()
        if let labelSnapshot = labelSnapshot {
            labelSnapshot.alpha = 1
            insertSubview(labelSnapshot, at: 0)
        }
    }

    func cleanUp() {
        labelSnapshot?.removeFromSuperview()
    }
}
