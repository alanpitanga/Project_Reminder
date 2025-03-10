//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Alan Pitanga on 27/02/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    private let loginView = LoginBottomSheetView()
    private var handleAreaHeight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupGesture()
    }
    
    private func setupUI() {
        view.addSubview(loginView)
        loginView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightContraint = loginView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
   
    private func setupGesture() {
       
    }
    
    private func handlePanGesture() {
        
    }
    
    func animatedShow(completion: (() -> Void)? = nil) {
       self.view.layoutIfNeeded()
       loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
       UIView.animate(withDuration: 0.3, animations:  {
           self.loginView.transform = .identity
           self.view.layoutIfNeeded()
       }) { _ in
           completion?()
       }
   }
    
}
