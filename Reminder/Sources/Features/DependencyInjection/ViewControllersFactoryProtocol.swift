//
//  DependencyInjectionProtocol.swift
//  Reminder
//
//  Created by Alan Pitanga on 19/03/25.
//

import Foundation

protocol ViewControllerFactoryProtocol: AnyObject {
    func makeSplashViewController(flowDelegate: SplashFlowDelegate) -> SplashViewController
    func makeLoginBottomSheetViewController(flowDelegate: LoginBottomSheetFlowDelegate) -> LoginBottomSheetViewController
    func makeHomeViewController(flowDelegate: HomeFlowDelegate) -> HomeViewController
}
