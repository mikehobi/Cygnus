//
//  MainViewController.swift
//  Cygnus
//
//  Created by Mike Hobizal on 5/16/19.
//  Copyright © 2018 Mike Hobizal. All rights reserved.
//

import UIKit
import SnapKit
import BonMot

class MainViewController: StackViewController {
    
    // Buttons
    let oneButton =
        Button("One",
               options: [
                .backgroundColor(.gray),
                .titleStyle([.color(.black)])])
    
    let twoButton =
        Button("Two",
               options: [
                .backgroundColor(.black),
                .titleStyle([.color(.white)])])

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title
        let title = Text("Cygnus", .font(.systemFont(ofSize: 24)))
        let titleView = View(title, options: [.padding(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))])
        
        // Subtitle
        let subtitle = Text("Experimental Views", .font(.systemFont(ofSize: 24)), .color(.gray))
        let subtitleView = View(subtitle, options: [.padding(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))])
        
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
                    .padding(UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40)),
                    .backgroundColor(.gray)])
        
        
        // Button Row
        let buttonRow = Row([oneButton, twoButton], options: [.spacing(8), .padding(UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))])
        
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
                    .padding(UIEdgeInsets(top: 40, left: 20, bottom: 60, right: 20)),
                    .backgroundColor(.black)])
        
        let views = [
            Spacer(height: 60),
            titleView,
            Spacer(height: 8),
            subtitleView,
            Spacer(height: 20),
            buttonRow,
            Spacer(height: 32),
            boxWrapper,
            myViewWrapper
        ]
        
        self.setupViews(
            views,
            options: [
                .backgroundColor(.black),
                .distribution(.equalSpacing)])
        
        setup()
    }

    func setup() {
        oneButton.addTarget(self, action: #selector(handleOnePress), for: .touchUpInside)
        twoButton.addTarget(self, action: #selector(handleTwoPress), for: .touchUpInside)
    }
    
    @objc func handleOnePress() {
        let destinationViewController = SecondViewController()
        self.present(destinationViewController, animated: true)
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
                    .padding(UIEdgeInsets(top: 40, left: 0, bottom: 40, right: 0)),
                    .backgroundColor(.black),
                    .titleStyle([.color(.white)])]) {
            $0.addTarget(self, action: #selector(self.dismissModal), for: .touchUpInside)
        }
        
        let views = [
            Spacer(height: 100),
            view,
            Spacer(height:30),
            button
        ]
        
        let viewController = StackViewController(views, options: [.backgroundColor(.blue)])
        
        self.present(viewController, animated: true)
    }
    
    @objc func dismissModal() {
        self.dismiss(animated: true)
    }

}

