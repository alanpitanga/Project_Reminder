//
//  HomeView.swift
//  Reminder
//
//  Created by Alan Pitanga on 30/03/25.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    private let userImage: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        
        addSubview(userImage)
        addSubview(welcomeLabel)
        addSubview(userLabel)
    }
    
    private func configureContraints() {
        NSLayoutConstraint.activate([
            userImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.large),
            userImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.large),
            userImage.heightAnchor.constraint(equalToConstant: 64),
            userImage.widthAnchor.constraint(equalToConstant: 64)
        ])
    }
}
