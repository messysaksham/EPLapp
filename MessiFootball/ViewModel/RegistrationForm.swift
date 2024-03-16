//
//  RegistrationForm.swift
//  MessiFootball
//
//  Created by Saksham on 17/03/24.
//

import Foundation
import Firebase

class RegistrationForm: ObservableObject {
    @Published var errorMessage: String?

    func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
          
            print("User registered successfully")
        }
    }
}
