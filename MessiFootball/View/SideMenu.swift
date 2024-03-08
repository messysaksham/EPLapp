//
//  SideMenu.swift
//  MessiFootball
//
//  Created by Saksham on 05/03/24.
//

import SwiftUI
import FirebaseAuth


struct SideMenu : View {
    @State private var isMenuOpen = false
    @State private var isloggedin = true
    @EnvironmentObject var users : Viewmodel
    
   
    let kfimage = KFimage()
    
    
   private  let username = UserDefaults.standard.string(forKey: "username")
 private  let email = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
      
       
        ZStack {
            
            if !isloggedin{
                EntryView()
                    .transition(.opacity)
                    
            }else{
                
                VStack (alignment :.leading){
                    
                    
                    Button(action: {
                        withAnimation {
                            self.isMenuOpen.toggle()
                            
                            
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                        
                    }
                    
                    .offset(x: isMenuOpen ? UIScreen.main.bounds.width / 2 : 0)
                    .animation(.default)
                    
                    
                    VStack(spacing: 20) {
                        
                        
                        Text("Welcome")
                            .foregroundColor(.white)
                            .font(.title)
                        
                        Spacer()
                        
                        Text(username ?? "")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                        Text(email ?? "ttt")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding()
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("EPL")
                                .foregroundColor(.white)
                        }
                        Button(action: {
                            do {
                                try Auth.auth().signOut()
                                isloggedin = false
                                print ("successfully signed out")
                            } catch let signOutError as NSError {
                                // An error occurred while signing out
                                print("Error signing out: \(signOutError.localizedDescription)")
                            }
                            isMenuOpen = false
                        }) {
                            Text("Log Out")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                            
                        }
                        
                        
                        Divider()
                    }
                    .padding()
                    
                    
                    .frame(maxWidth:.infinity, maxHeight:.infinity, alignment: .leading)
                    
                    .background(Color.cyan)
                    .offset(x: isMenuOpen ? -120 : -UIScreen.main.bounds.width)
                    .animation(.default)
                    
                    
                }.padding()
            }}
        }
}


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        
        let mockViewModel = Viewmodel()
        return SideMenu()
            .environmentObject(mockViewModel) 
    }
}
