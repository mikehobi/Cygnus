//
// UIView+padding.swift
// 2019 Instrument Marketing
//

import SnapKit
import UIKit

public extension UIView {
    enum Edge {
        case all(_ value: CGFloat)
        case top(_ value: CGFloat)
        case left(_ value: CGFloat)
        case right(_ value: CGFloat)
        case bottom(_ value: CGFloat)
        case horizontal(_ value: CGFloat)
        case vertical(_ value: CGFloat)
    }

    func padding(_ edges: Edge...) -> UIView {
        let wrap = UIView()
        wrap.addSubview(self)
        snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        snp.updateConstraints {
            for edge in edges {
                switch edge {
                case let .all(inset):
                    $0.edges.equalToSuperview().inset(inset)
                case let .top(inset):
                    $0.top.equalToSuperview().inset(inset)
                case let .left(inset):
                    $0.left.equalToSuperview().inset(inset)
                case let .right(inset):
                    $0.right.equalToSuperview().inset(inset)
                case let .bottom(inset):
                    $0.bottom.equalToSuperview().inset(inset)
                case let .horizontal(inset):
                    $0.left.right.equalToSuperview().inset(inset)
                case let .vertical(inset):
                    $0.top.bottom.equalToSuperview().inset(inset)
                }
            }
        }
        return wrap
    }
}
