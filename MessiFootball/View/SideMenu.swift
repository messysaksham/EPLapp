//
//  SideMenu.swift
//  MessiFootball
//
//  Created by Saksham on 05/03/24.
//

import SwiftUI


struct SideMenu : View {
    @State private var isMenuOpen = false
    @EnvironmentObject var users : Viewmodel
   
    let kfimage = KFimage()
    
    var body: some View {
        ZStack {
            
            
            
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
                    kfimage.getImage(url: users.user?.avatar_url ?? "")
                    
                    Text("Welcome")
                        .foregroundColor(.white)
                    Text(users.user?.login ?? "" )
                        .font(.footnote)
                        .foregroundColor(.white)
                    
                    Button(action: {
                        
                    }) {
                        Text("Menu Item 1")
                            .foregroundColor(.white)
                    }
                    Button(action: {
                        
                    }) {
                        Text("Menu Item 2")
                            .foregroundColor(.white)
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


struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        
        let mockViewModel = Viewmodel()
        return SideMenu()
            .environmentObject(mockViewModel) 
    }
}
