//
//  EntryView.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI
import Firebase
import FirebaseAuth



struct EntryView: View {
    
    @EnvironmentObject private var userinfo : Viewmodel
    
    var body: some View {
        
        if userinfo.isloggedin || Auth.auth().currentUser != nil  {
            
            MainEntryView()
            
        }else{
            LoginPageView()
        }
    }
}

#Preview {
    EntryView()
        
}
