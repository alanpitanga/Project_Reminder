//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Alan Pitanga on 10/03/25.
//

import Foundation
import Firebase

protocol LoginBottomSheetViewDelegate: AnyObject {
    
    func sendLogin(user: String, password: String) 
}
