//
//  LoginView.swift
//  MessiFootball
//
//  Created by Saksham on 15/02/24.
//

import SwiftUI

struct LoginView: View {
    
    @Binding var isloggedin : Bool
    
    var body: some View {
        
        if isloggedin{
            
            TabbView()
        }else{
            EntryView()
            
        }
        
        
        
    }
}

#Preview {
    LoginView(isloggedin:.constant(true))
}
