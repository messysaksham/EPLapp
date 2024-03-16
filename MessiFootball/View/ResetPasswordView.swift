//
//  ResetPasswordView.swift
//  MessiFootball
//
//  Created by Saksham on 17/03/24.
//

import SwiftUI

import SwiftUI
import FirebaseAuth

struct ResetPasswordView: View {
    @State private var email: String = ""
    @State private var isPasswordResetSent = false
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()

            Button(action: resetPassword) {
                Text("Reset Password")
            }
            .foregroundColor(Color(hex: "#FFF9FF"))
                .font(.system(size: 18))
                .fontWeight(.bold)
            .frame(height: 65)
                .frame(maxWidth: .infinity,alignment: .center)
                .background(Color(hex: "#53B175"))
                .cornerRadius(20)
                .padding(.vertical,20)
            .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            if isPasswordResetSent {
                Text("Email sent successfully, Please reset your password and login again. Thanks")
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
        .navigationBarTitle("Forgot Password")
        .padding()
    }

    func resetPassword() {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
               self.isPasswordResetSent = true
                self.errorMessage = nil
            }
        }
    }
}

#Preview {
    ResetPasswordView()
}
