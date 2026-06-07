//
//  HomeView.swift
//  Reminder
//
//  Created by Alan Pitanga on 30/03/25.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    weak public var delegate: HomeViewDelegate?
    
    let profileBackground: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.gray600
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentBackground: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Metrics.medium
        view.layer.masksToBounds = true
        view.backgroundColor = Colors.gray800
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
            imageView.layer.cornerRadius = Metrics.medium
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "home.welcome.label".localized
        label.font = Typography.input
        label.textColor = Colors.gray200
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = Typography.heading
        textField.placeholder = "Digite seu nome"
        textField.textColor = Colors.gray100
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let myPrescriptionButtons: ButtonHomeView = {
        let button = ButtonHomeView(icon: UIImage(named: "Paper"),
                                    tittle: "Minhas receitas",
                                    description: "Acompanhe os medicamentos e gerencie lembretes")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let newPrescriptionButton: ButtonHomeView = {
        let button = ButtonHomeView(icon: UIImage(named: "pills"),
                                    tittle: "Nova receita",
                                    description: "Cadastre novos lembretes de receitas")
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitle("home.feedback.button.title".localized, for: .normal)
        button.backgroundColor = Colors.gray100
        button.layer.cornerRadius = Metrics.medium
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(profileBackground)
        profileBackground.addSubview(profileImage)
        profileBackground.addSubview(welcomeLabel)
        profileBackground.addSubview(nameTextField)
        addSubview(contentBackground)
        contentBackground.addSubview(feedbackButton)
        contentBackground.addSubview(myPrescriptionButtons)
        contentBackground.addSubview(newPrescriptionButton)
        
        configureContraints()
        setImageGesture()
    }
    
    private func configureContraints() {
        NSLayoutConstraint.activate([
            
            profileBackground.topAnchor.constraint(equalTo: topAnchor),
            profileBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileBackground.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            profileImage.topAnchor.constraint(equalTo: profileBackground.topAnchor, constant: Metrics.huge),
            profileImage.leadingAnchor.constraint(equalTo: profileBackground.leadingAnchor, constant: Metrics.medium),
            profileImage.heightAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            profileImage.widthAnchor.constraint(equalToConstant: Metrics.profileImageSize),
            
            welcomeLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: Metrics.small),
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: Metrics.little),
            nameTextField.leadingAnchor.constraint(equalTo: profileImage.leadingAnchor),
            
            contentBackground.topAnchor.constraint(equalTo: profileBackground.bottomAnchor),
            contentBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            feedbackButton.bottomAnchor.constraint(equalTo: contentBackground.bottomAnchor, constant: -Metrics.medium),
            feedbackButton.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            feedbackButton.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
            feedbackButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize),
            
            myPrescriptionButtons.topAnchor.constraint(equalTo: contentBackground.topAnchor, constant: Metrics.huge),
            myPrescriptionButtons.leadingAnchor.constraint(equalTo: contentBackground.leadingAnchor, constant: Metrics.medium),
            myPrescriptionButtons.trailingAnchor.constraint(equalTo: contentBackground.trailingAnchor, constant: -Metrics.medium),
            myPrescriptionButtons.heightAnchor.constraint(equalToConstant: 112),
            
            newPrescriptionButton.topAnchor.constraint(equalTo: myPrescriptionButtons.bottomAnchor, constant: Metrics.medium),
            newPrescriptionButton.leadingAnchor.constraint(equalTo: myPrescriptionButtons.leadingAnchor),
            newPrescriptionButton.trailingAnchor.constraint(equalTo: myPrescriptionButtons.trailingAnchor),
            newPrescriptionButton.heightAnchor.constraint(equalTo: myPrescriptionButtons.heightAnchor)

        ])
    }
    
    private func setupTextField() {
        nameTextField.addTarget(self,
                                action: #selector(nameTextFieldDidEndEditing),
                                for: .editingDidEnd)
        nameTextField.delegate = self
    }
    
    private func setImageGesture() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(profileImageTapped))
        profileImage.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc
    private func profileImageTapped() {
        delegate?.didTapProfileImage()
    }
    
    @objc
    private func nameTextFieldDidEndEditing() {
        let userNameText = nameTextField.text ?? ""
        UserDefaultsManager.saveNameUser(name: userNameText)
    }
}

extension HomeView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let userNameText = nameTextField.text ?? ""
        UserDefaultsManager.saveNameUser(name: userNameText)
        return true
    }
}
