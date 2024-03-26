//
//  RegistrationView.swift
//  MessiFootball
//
//  Created by Saksham on 17/03/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @StateObject private var firebaseManager = RegistrationForm()
  
    
        var body: some View {
            
            VStack {
                TextField("Email", text: $email)
                    .foregroundColor(Color(hex: "#181725"))
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 18))
                    .frame(height: 22)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(hex: "#ffffff"))
                    .padding(.vertical,12)
                SecureField("Password", text: $password)
                    .foregroundColor(Color(hex: "#181725"))
                    .textInputAutocapitalization(.never)
                    .font(.system(size: 18))
                    .frame(height: 22)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color(hex: "#ffffff"))
                    .padding(.vertical,12)
                Button("Register") {
                    // Call FirebaseManager to register the user
                    firebaseManager.registerUser(email: email, password: password)
                }.foregroundColor(Color(hex: "#FFF9FF"))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                    .frame(height: 65)
                    .frame(maxWidth: .infinity,alignment: .center)
                    .background(Color(hex: "#53B175"))
                    .cornerRadius(20)
                    .padding(.vertical,20)
                if let errorMessage = firebaseManager.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }


#Preview {
    RegistrationView()
}
