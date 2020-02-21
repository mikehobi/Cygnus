//
//  ViewController.swift
//  Example-iOS
//
//  Created by Mike Hobizal on 6/24/19.
//  Copyright © 2019 Mike Hobizal. All rights reserved.
//

import UIKit
import Cygnus

class ViewController: StackViewController {

    // Buttons
    let oneButton = Button("Button One", style: .dark)

    let twoButton = Button("Button Two", style: .light)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Title
        let title = Text("Cygnus", .font(.systemFont(ofSize: 24)))
        let titlePadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let titleView = View(title, options: [.padding(titlePadding)])

        // Subtitle
        let subtitle = Text("Experimental Views", .font(.systemFont(ofSize: 24)), .color(.gray))
        let subtitlePadding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        let subtitleView = View(subtitle, options: [.padding(subtitlePadding)])

        // Button Row
        let buttonRow = Row([oneButton, Spacer(.fillHorizontal), twoButton],
                            options: [
                                .distribution(.fillEqually),
                                .spacing(0),
                                .padding(.horizontal(20))])

        // Box
        let box = UIView()
        box.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        box.layer.cornerRadius = 8
        box.snp.makeConstraints { make in
            make.height.equalTo(500)
        }

        // Box Wrapper
        let boxPadding = UIEdgeInsets(top: 60, left: 20, bottom: 60, right: 20)
        let boxWrapper =
            View(box,
                 options: [
                    .padding(boxPadding),
                    .backgroundColor(UIColor.init(red: 100/255, green: 100/255, blue: 230/255, alpha: 1.0))])

        let views = [
            Spacer(height: 60),
            titleView,
            Spacer(height: 8),
            subtitleView,
            Spacer(height: 20),
            buttonRow,
            Spacer(height: 32),
            boxWrapper,
        ]

        self.setupViews(
            views,
            options: [
                .backgroundColor(.black),
                .distribution(.equalSpacing),
            ]
        )
    }

}

