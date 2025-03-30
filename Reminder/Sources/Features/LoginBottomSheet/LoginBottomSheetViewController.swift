//
//  LoginBottomSheetViewController.swift
//  Reminder
//
//  Created by Alan Pitanga on 27/02/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    private let contentView: LoginBottomSheetView
    private let viewModel = LoginBottomSheetViewModel()
    private var handleAreaHeight: CGFloat = 50.0
    public weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: LoginBottomSheetView,
         flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        setupUI()
        setupGesture()
        bindViewModel()
    }
    
    private func setupUI() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightContraint = contentView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
   
    private func setupGesture() {
       
    }
    
    private func handlePanGesture() {
        
    }
    
    func bindViewModel() {
        viewModel.succesResult = {[ weak self] userNameLogin in
            self?.presentSaveLoginAlert(email: userNameLogin)
        }
        
        viewModel.errorResult = { [ weak self] errorMessage in
            self?.presentErrorAlert(message: errorMessage)
        }
    }
    
    private func presentSaveLoginAlert(email: String) {
        let alertController = UIAlertController(title: "Salvar Acesso",
                                                message: "Deseja salvar seu acesso?",
                                                preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Salvar", style: .default) {_ in
            
            let user = User(email: email, isUserSaved: true)
            UserDefaultsManager.savedUser(user: user)
            self.flowDelegate?.navigateToHome()
        }
        
        
        let cancelAction = UIAlertAction(title: "Não", style: .cancel) {_ in
            self.flowDelegate?.navigateToHome()
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true)
    }
    
    private func presentErrorAlert(message: String) {
        let alertController = UIAlertController(title: "Erro ao logar",
                                                message: message,
                                                preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Tentar Novamente",
                                        style: .default)
        alertController.addAction(retryAction)
        self.present(alertController, animated: true)
    }
    
    func animatedShow(completion: (() -> Void)? = nil) {
       self.view.layoutIfNeeded()
        contentView.transform = CGAffineTransform(translationX: 0, y: contentView.frame.height)
       UIView.animate(withDuration: 0.3, animations:  {
           self.contentView.transform = .identity
           self.view.layoutIfNeeded()
       }) { _ in
           completion?()
       }
   }
    
}

extension LoginBottomSheetViewController: LoginBottomSheetViewDelegate {
    func sendLogin(user: String, password: String) {
        viewModel.doAuth(userNameLogin: user, password: password)
    }
    
}
