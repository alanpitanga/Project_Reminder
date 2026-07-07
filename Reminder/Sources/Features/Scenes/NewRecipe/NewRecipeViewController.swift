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
    private let viewModel = NewRecipeViewModel()
    
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
        newRecipeView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        newRecipeView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func addButtonTapped() {
        let remedy = newRecipeView.remedyInput.getText()
        let time = newRecipeView.timeInput.getText()
        let recurrence = newRecipeView.recurrencyInput.getText()
        let takeNow = false
        
        viewModel.addRecipe(remedy: remedy,
                            time: time,
                            recurrence: recurrence,
                            takeNow: takeNow)
        
        print("receita \(remedy) adicionada")
    }
    
    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupConstraints() {
        newRecipeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            newRecipeView.topAnchor.constraint(equalTo: view.topAnchor),
            newRecipeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newRecipeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newRecipeView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
