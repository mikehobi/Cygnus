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

class ThirdVC: UIViewController {

    enum Dog {
        case Bernese
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue

//        let newView = UIView()
//        newView.backgroundColor = .red
//        self.view.addSubview(newView)
//
//        newView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.size.equalTo(200)
//        }
//
//        let label = UILabel()
//        label.attributedText = "Dog".styled(with: .font(.systemFont(ofSize: 20)), .color(.white))
//        label.textAlignment = .center
//        newView.addSubview(label)
//
//        label.snp.makeConstraints { make in
//            make.top.equalToSuperview()
//            make.centerX.equalToSuperview()
//            make.left.right.equalToSuperview()
//        }


        let label = Text("Dog", .font(.systemFont(ofSize: 20)), .color(.white), .alignment(.center))
        let labelTwo = Text("Cat", .font(.systemFont(ofSize: 20)), .color(.white), .alignment(.center))

        let newView = Col([label, labelTwo])
        newView.backgroundColor = .red
        self.view.addSubview(newView)
        newView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(200)
        }
    }

}

class otherVC: StackViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
