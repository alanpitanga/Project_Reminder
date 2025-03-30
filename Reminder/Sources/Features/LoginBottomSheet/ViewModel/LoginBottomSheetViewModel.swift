//
//  BottomSheetViewModel.swift
//  Reminder
//
//  Created by Alan Pitanga on 10/03/25.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    
    var succesResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?
    func doAuth(userNameLogin: String, password: String) {
        print(userNameLogin)
        Auth.auth().signIn(withEmail: userNameLogin, password: password) {[ weak self ] authResult, error in
            if let error = error {
                self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas")
            } else {
                self?.succesResult?(userNameLogin)
            }
        }
    }
}
