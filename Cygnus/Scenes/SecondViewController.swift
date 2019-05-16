//
//  SecondViewController.swift
//  Cygnus
//
//  Created by Mike Hobizal on 12/4/18.
//  Copyright © 2018 Mike Hobizal. All rights reserved.
//

import UIKit

class SecondViewController: StackViewController {
    
    override init() {
        
        let view = UIView()
        view.backgroundColor = .black
        view.snp.makeConstraints { make in
            make.size.equalTo(100)
        }
        
        let button =
            Button("Go Back",
                   options: [
                    .backgroundColor(.black),
                    .titleStyle([.color(.white)])])
        
        let views = [
            Spacer(height: 80),
            view,
            button
        ]
        
        super.init(views,
                   options: [
                    .distribution(.equalSpacing),
                    .alignment(.center),
                    .spacing(20)])
        
        button.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onButtonTap() {
        self.dismiss(animated: true)
    }

}
