//
//  ViewController.swift
//  Eula-Sample-Application
//
//  Created by Adam Cooper on 9/15/16.
//  Copyright © 2016 Adam Cooper. All rights reserved.
//

import UIKit
import Eula

class ViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.title = "Sample"
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.termsButton)
        self.view.addSubview(self.privacyButton)

        
        self.setupConstraints()
    }
    
    // MARK: - Actions
    
    func onTermsButtonPressed(sender: UIButton!) {
        let terms = ELAManager.termsOfServiceViewController()
        self.navigationController?.pushViewController(terms!, animated: true)
    }
    
    func onPrivacyButtonPressed(sender: UIButton!) {
        let privacy = ELAManager.privacyPolicyViewController()
        let navigationController = UINavigationController(rootViewController: privacy!)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - Properties
    
    lazy var termsButton: UIButton = {
        var temporaryLoginButton = UIButton()
        temporaryLoginButton.translatesAutoresizingMaskIntoConstraints = false
        temporaryLoginButton.backgroundColor = .red
        temporaryLoginButton.setTitle("Present Terms", for: .normal)
        temporaryLoginButton.setTitleColor(.white, for: .normal)
        temporaryLoginButton.addTarget(self, action: #selector(onTermsButtonPressed), for: .touchUpInside)
        return temporaryLoginButton
    }()
    
    lazy var privacyButton: UIButton = {
        var temporaryLoginButton = UIButton()
        temporaryLoginButton.translatesAutoresizingMaskIntoConstraints = false
        temporaryLoginButton.backgroundColor = .blue
        temporaryLoginButton.setTitle("Present Privacy", for: .normal)
        temporaryLoginButton.setTitleColor(.white, for: .normal)
        temporaryLoginButton.addTarget(self, action: #selector(onPrivacyButtonPressed), for: .touchUpInside)
        return temporaryLoginButton
    }()
    
    
    // MARK: - Constraints
    
    func setupConstraints()
    {
        //Terms Button Constraints
        self.view.addConstraint(NSLayoutConstraint(item: self.termsButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: self.termsButton, attribute: .trailing, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.termsButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.termsButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44))
        
        //Privacy Button Constraints
        self.view.addConstraint(NSLayoutConstraint(item: self.privacyButton, attribute: .top, relatedBy: .equal, toItem: self.termsButton, attribute: .bottom, multiplier: 1.0, constant: 12))
        self.view.addConstraint(NSLayoutConstraint(item: self.privacyButton, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.view, attribute: .trailing, relatedBy: .equal, toItem: self.privacyButton, attribute: .trailing, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.privacyButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 44))
    }
    
}

