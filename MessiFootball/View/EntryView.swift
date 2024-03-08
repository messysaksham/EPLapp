//
//  EntryView.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI
import Kingfisher
import KeychainAccess
import GoogleSignIn
import Firebase
import FirebaseAuth



struct EntryView: View {
    
    @State private  var username = ""
    @State private  var email = ""
    @EnvironmentObject var userinfo : Viewmodel
    
    @State var  isauthorized = false
    
    let url = URL(string: "https://cdn.freelogovectors.net/wp-content/uploads/2023/04/premier-league-logo-01-freelogovectors.net_.png")
    
  
    
    var body: some View {
        
        
        
        if isauthorized || Auth.auth().currentUser != nil  {
            
            SideMenu()
                
                
            
        }else{
            
            VStack(spacing : 70){
                
                KFImage(url)
                    .resizable()
                    .cacheMemoryOnly()
                    .frame(width: 500 , height: 400)
                
                
                Button{
                    
                    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                            
                    let config = GIDConfiguration(clientID: clientID)

                    GIDSignIn.sharedInstance.configuration = config
                            
                    GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { signResult, error in
                                
                        if let error = error {
                           
                           return
                        }
                                
                         guard let user = signResult?.user,
                               let idToken = user.idToken else { return }
                         
                         let accessToken = user.accessToken
                                
                         let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)

                        // Use the credential to authenticate with Firebase
                        Auth.auth().signIn(with: credential) { result, error in
                            
                          
                            
                            
                            if let user = Auth.auth().currentUser {
                                
                                print("successfully signed in ")
                                
                                self.username = user.displayName ?? ""
                                
                                self.email = user.email ?? ""
                               
                                userinfo.Newuser(username: username, avatar: email)
                                isauthorized = true
                            }
                            
                        }
                    }

                    
                    
                }label: {
                    Text("Login with Google")
                        .frame(width:200,height: 35)
                        .foregroundStyle(.white)
                        .background(.black)
                    
                }
                
            }
        }
        
    }
     
    
}

#Preview {
    EntryView()
        
}
