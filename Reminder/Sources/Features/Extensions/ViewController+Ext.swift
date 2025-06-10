//
//  ViewController+Ext.swift
//  Reminder
//
//  Created by Alan Pitanga on 30/03/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    func setupContentViewToBounds(contentView: UIView) {
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
