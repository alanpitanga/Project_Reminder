//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Alan Pitanga on 13/03/25.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
