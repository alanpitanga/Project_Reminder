//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Alan Pitanga on 10/03/25.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    
    func sendLogin(user: String, password: String) 
}
