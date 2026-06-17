//
//  NewRecipeViewController.swift
//  Reminder
//
//  Created by Alan Pitanga on 07/06/26.
//
import Foundation
import UIKit

class NewRecipeViewController: UIViewController {
    
    private let newRecipeView = NewRecipeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newRecipeView)
        
        setupConstraints()
    }
    
    private func setupActions() {
        
    }
    
    private func setupConstraints() {
        newRecipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            newRecipeView.topAnchor.constraint(equalTo: view.topAnchor),
            newRecipeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newRecipeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newRecipeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

            
        ])
    }
    
}
