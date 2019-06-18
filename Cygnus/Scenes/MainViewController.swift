//
//  MainViewController.swift
//  Cygnus
//
//  Created by Mike Hobizal on 5/16/19.
//  Copyright © 2018 Mike Hobizal. All rights reserved.
//

import BonMot
import SnapKit
import UIKit

class MainViewController: StackViewController {
    // Buttons
    let oneButton =
        Button("Button One", options: [.backgroundColor(.gray), .color(.black), .padding(.horizontal(16))])

    let twoButton =
        Button("Button Two", options: [.backgroundColor(.black), .color(.white), .padding(.horizontal(16))])

    override func viewDidLoad() {
        super.viewDidLoad()

        // Title
        let title = Text("Cygnus", .font(.systemFont(ofSize: 24)))
        let titleView = View(title, options: [.padding(.horizontal(20))])

        // Subtitle
        let subtitle = Text("Experimental Views", .font(.systemFont(ofSize: 24)), .color(.gray))
        let subtitleView = View(subtitle, options: [.padding(.horizontal(20))])


        Button("Button One", options: [.backgroundColor(.gray), .color(.black), .padding(.horizontal(16))])

        // Box
        let box = UIView()
        box.backgroundColor = .black
        box.layer.cornerRadius = 8
        box.snp.makeConstraints { make in
            make.height.equalTo(200)
        }

        // Box Wrapper
        let boxWrapper =
            View(box,
                 options: [
                     .padding(.all(40)),
                     .backgroundColor(.gray),
                 ])

        // Button Row
//        let buttonRow = Row([oneButton, twoButton], options: [.spacing(8), .padding(.horizontal(20))])
        let buttonRow = Row([oneButton, Spacer(.fillHorizontal), twoButton],
                            options: [.distribution(.fill), .spacing(8), .padding(.horizontal(20))])

        // Another View
        let myView = UIView()
        myView.backgroundColor = .white
        myView.layer.cornerRadius = 8
        myView.snp.makeConstraints { make in
            make.height.equalTo(300)
        }

        // Wrapper of Another View
        let myViewWrapper =
            View(myView,
                 options: [
                     .padding(.all(40, 20, 40, 20)),
                     .backgroundColor(.black),
                 ])

        let views = [
            Spacer(height: 60),
            titleView,
            Spacer(height: 8),
            subtitleView,
            Spacer(height: 20),
            buttonRow,
            Spacer(height: 32),
            boxWrapper,
            myViewWrapper,
        ]

        setupViews(
            views,
            options: [
                .backgroundColor(.black),
                .distribution(.equalSpacing),
            ]
        )

        setup()
    }

    func setup() {
        oneButton.addTarget(self, action: #selector(handleOnePress), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(handleTwoPress), for: .touchUpInside)
    }

    @objc func handleOnePress() {
        let destinationViewController = SecondViewController()
        present(destinationViewController, animated: true)
    }

    @objc func handleTwoPress() {
        let view = UIView()
        view.backgroundColor = .green
        view.snp.makeConstraints { make in
            make.height.equalTo(view.snp.width)
        }

        let button =
            Button("Go Back",
                   options: [
                       .padding(.vertical(40)),
                       .backgroundColor(.black),
                       .color(.white),
                   ])

        let views = [
            Spacer(height: 100),
            view,
            Spacer(height: 30),
            button,
        ]

        let viewController = StackViewController(views, options: [.backgroundColor(.blue)])

        present(viewController, animated: true)
    }

    @objc func dismissModal() {
        dismiss(animated: true)
    }
}
