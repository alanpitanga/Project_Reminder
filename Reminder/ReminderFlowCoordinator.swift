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
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return navigationController
    }
}
