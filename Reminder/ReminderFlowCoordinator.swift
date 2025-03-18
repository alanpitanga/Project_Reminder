//
//  ReminderFlowCoordinator.swift
//  Reminder
//
//  Created by Alan Pitanga on 12/03/25.
//

import Foundation
import UIKit


class ReminderFlowCoordinator {
    
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let startViewController = SplashViewController(flowDelegate: self)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}

extension ReminderFlowCoordinator: LoginBottomSheetFlowDelegate {
    func navigateToHome() {
        self.navigationController?.dismiss(animated: true)
        let viewController = UIViewController()
        viewController.view.backgroundColor = .red
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ReminderFlowCoordinator: SplashFlowDelegate {
    func navigateToLogin() {
        let loginBottomSheet = LoginBottomSheetViewController(flowDelegate: self)
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.navigationController?.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animatedShow()
        }
    }
    
}
