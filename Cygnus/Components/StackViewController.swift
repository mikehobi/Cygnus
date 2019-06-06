//
//  StackViewController.swift
//  nike-mx
//
//  Created by Mike Hobizal on 5/10/19.
//  Copyright © 2019 Instrument Marketing. All rights reserved.
//

import UIKit

public struct StackViewControllerOptions {
    public var backgroundColor: UIColor?
    public var distribution: UIStackView.Distribution?
    public var alignment: UIStackView.Alignment?
    public var spacing: CGFloat?
    public var disableScroll: Bool?

    public enum Part {
        case backgroundColor(UIColor)
        case distribution(UIStackView.Distribution)
        case alignment(UIStackView.Alignment)
        case spacing(CGFloat)
        case disableScroll(Bool)
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
        case let .spacing(spacing):
            self.spacing = spacing
        case let .disableScroll(disableScroll):
            self.disableScroll = disableScroll
        }
    }
}

class StackViewController: UIViewController {
    /// Changes the status bar appearance
    var statusBarStyle: UIStatusBarStyle = .default
    var isStatusBarHidden: Bool = false

    override var prefersStatusBarHidden: Bool {
        return isStatusBarHidden
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .fade
    }

    func updateStatusBar(style: UIStatusBarStyle, isHidden: Bool = false) {
        statusBarStyle = style
        isStatusBarHidden = isHidden
        setNeedsStatusBarAppearanceUpdate()
    }

    // Views
    let scroll = UIScrollView()

    let stack = UIStackView()

    // Init
    init(_ views: [UIView], options: [StackViewControllerOptions.Part]) {
        super.init(nibName: nil, bundle: nil)

        setupDefaults()

        setupViews(views, options: options)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setupDefaults()
    }

    /// Sets up the defaults
    func setupDefaults() {
        // Default backgroundColor
        view.backgroundColor = .white

        edgesForExtendedLayout = []

        // Defaults for stack
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .equalSpacing

        // Defaults for scroll
        scroll.contentInsetAdjustmentBehavior = .never
        scroll.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    /// Sets up views into are stack view and applies options
    ///
    /// - Parameters:
    ///   - views: Views to be added to stackView
    ///   - options: Options for our view controller, stackview and scrollview
    func setupViews(_ views: [UIView], options: [StackViewControllerOptions.Part]) {
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
        applyOptions(viewOptions)
    }

    func applyOptions(_ viewOptions: StackViewControllerOptions) {
        if let backgroundColor = viewOptions.backgroundColor {
            view.backgroundColor = backgroundColor
        }

        if let alignment = viewOptions.alignment {
            stack.alignment = alignment
        }

        if let distribution = viewOptions.distribution {
            stack.distribution = distribution
        }

        if let spacing = viewOptions.spacing {
            stack.spacing = spacing
        }

        if let disableScroll = viewOptions.disableScroll {
            scroll.isScrollEnabled = !disableScroll
        }
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
