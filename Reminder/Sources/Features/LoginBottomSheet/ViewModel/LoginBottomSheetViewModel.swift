//
//  BottomSheetViewModel.swift
//  Reminder
//
//  Created by Alan Pitanga on 10/03/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    
    var succesResult: (() -> Void)?
    func doAuth(userNameLogin: String, password: String) {
        print(userNameLogin)
        Auth.auth().signIn(withEmail: userNameLogin, password: password) {[ weak self ] authResult, error in
            if let error = error {
                print("Falha na autenticação\(error )")
            } else {
                self?.succesResult?()
            }
        }
    }
}
