//
//  Spacer.swift
//  NikeOmegaSwift
//
//  Created by Thomas Bruketta on 10/31/18.
//  Copyright © 2018 Instrument Marketing. All rights reserved.
//

import UIKit
import SnapKit

public enum SpacerType {
    case fillHorizontal
    case fillVertical
    
    var priority: UILayoutPriority {
        switch self {
        case .fillVertical, .fillHorizontal:
            return .defaultLow
        }
    }
    
    var axis: NSLayoutConstraint.Axis {
        switch self {
        case .fillVertical:
            return .vertical
        case .fillHorizontal:
            return .horizontal
        }
    }
}

public class Spacer: UIView {

    public init(height: CGFloat? = nil, width: CGFloat? = nil) {
        super.init(frame: .zero)

        snp.makeConstraints { make in
            if let height = height {
                make.height.equalTo(height)
            }

            if let width = width {
                make.width.equalTo(width)
            }
        }
    }

    public init(_ type: SpacerType) {
        super.init(frame: .zero)
        setContentHuggingPriority(type.priority, for: type.axis)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
