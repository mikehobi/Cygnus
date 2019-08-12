//
//  StackViewController.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit
import BonMot
import SnapKit

public struct StackViewControllerOptions {
    public var backgroundColor: UIColor?
    public var distribution: UIStackView.Distribution?
    public var alignment: UIStackView.Alignment?
    public var disableScroll: Bool?
    public var scrollTopAlignment: ScrollTopAlignment?

    public enum ScrollTopAlignment {
        case safeArea
        case top
    }

    public enum Part {
        case backgroundColor(UIColor)
        case distribution(UIStackView.Distribution)
        case alignment(UIStackView.Alignment)
        case disableScroll(Bool)
        case scrollTopAlignment(ScrollTopAlignment)
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

    mutating func update(part option: Part) {
        switch option {
        case let .alignment(alignment):
            self.alignment = alignment
        case let .backgroundColor(backgroundColor):
            self.backgroundColor = backgroundColor
        case let .distribution(distribution):
            self.distribution = distribution
        case let .disableScroll(disableScroll):
            self.disableScroll = disableScroll
        case let .scrollTopAlignment(scrollTopAlignment):
            self.scrollTopAlignment = scrollTopAlignment
        }
    }
}

open class StackViewController: UIViewController {

    /// Changes the status bar appearance
    var statusBarStyle: UIStatusBarStyle = .default
    var isStatusBarHidden: Bool = false

    override open var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }

    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override open var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }

    public func updateStatusBar(style: UIStatusBarStyle, isHidden: Bool = false, isAnimated: Bool = true, delay: TimeInterval = 0) {
        statusBarStyle = style
        isStatusBarHidden = isHidden

        if isAnimated {

            UIView.animate(withDuration: 0.25, delay: delay, animations: {
                self.setNeedsStatusBarAppearanceUpdate()
            })

        } else {

            self.setNeedsStatusBarAppearanceUpdate()

        }
    }

    // Views
    let scroll = UIScrollView()

    let stack = UIStackView()

    // Init
    public init(_ views: [UIView], options: [StackViewControllerOptions.Part]) {
        super.init(nibName: nil, bundle: nil)

        self.setupDefaults()

        setupViews(views, options: options)
    }

    public convenience init() {
        self.init([], options: [])
    }

    public func addView(_ view: UIView) {
        self.stack.addArrangedSubview(view)
    }

    public func addView(_ view: UIView, at index: Int) {
        if index > self.stack.arrangedSubviews.count {
            print("Invalid index")
            return
        }
        self.stack.insertArrangedSubview(view, at: index)
    }

    public func addViews(_ views: [UIView]) {
        self.stack.addArrangedSubviews(views)
    }

    /// Sets up the defaults
    func setupDefaults() {

        // Default backgroundColor
        self.view.backgroundColor = .white

        self.edgesForExtendedLayout = []

        // Defaults for stack
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing

        // Defaults for scroll
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.contentInset = .zero
    }

    /// Sets up views into are stack view and applies options
    ///
    /// - Parameters:
    ///   - views: Views to be added to stackView
    ///   - options: Options for our view controller, stackview and scrollview
    public func setupViews(_ views: [UIView], options: [StackViewControllerOptions.Part]) {

        // Add views
        for view in views {
            stack.addArrangedSubview(view)
        }

        // scroll
        view.addSubview(scroll)
        scroll.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        // stack in scroll
        scroll.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.edges.equalToSuperview()
        }


        let viewOptions = StackViewControllerOptions(options)
        self.applyOptions(viewOptions)
    }

    func applyOptions(_ viewOptions: StackViewControllerOptions) {
        if let backgroundColor = viewOptions.backgroundColor {
            self.view.backgroundColor = backgroundColor
        }

        if let alignment = viewOptions.alignment {
            stack.alignment = alignment
        }

        if let distribution = viewOptions.distribution {
            stack.distribution = distribution
        }

        if let disableScroll = viewOptions.disableScroll {
            scroll.isScrollEnabled = !disableScroll
        }

        if let scrollTopAlignment = viewOptions.scrollTopAlignment {
            switch scrollTopAlignment {
            case .top:
                scroll.snp.makeConstraints { make in
                    make.edges.equalToSuperview()
                }
            case .safeArea:
                scroll.snp.remakeConstraints { make in
                    make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                    make.left.right.bottom.equalToSuperview()
                }
            }
        }
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
