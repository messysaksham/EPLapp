//
//  EntryView.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI
import Kingfisher
import OAuthSwift

struct EntryView: View {
    
    
    @State var  isauthorized = false
   @State var tabselect = 1
    let url = URL(string: "https://cdn.freelogovectors.net/wp-content/uploads/2023/04/premier-league-logo-01-freelogovectors.net_.png")
    
    
    let oauthswift = OAuth2Swift(consumerKey: "1a43b6eca6543260ddd9", consumerSecret: "f7a721a5ac0648d6a6aa17f7a20c1feefd928f46", authorizeUrl:"https://github.com/login/oauth/authorize", accessTokenUrl: "https://github.com/login/oauth/access_token", responseType: "code")
    
    var body: some View {
        
        
      
        if isauthorized {
            TabbView()
        }else{
            
            
            
            
            
            VStack(spacing : 70){
                
                
                
                
                
                KFImage(url)
                    .resizable()
                    .cacheMemoryOnly()
                    .frame(width: 500 , height: 400)
                
                
                Button{
                    
                    OauthAuthentication()
                    
                    
                }label: {
                    Text("Login")
                        .frame(width:200,height: 35)
                        .foregroundStyle(.white)
                        .background(.black)
                    
                    
                }.onOpenURL(perform: { url in
                    
                    print("url received :",url)
                    
                    OAuthSwift.handle(url: url)
                    self.isauthorized = true
                    
                })
                
            }
        }
        
    }
    
    func OauthAuthentication() {
        
        if let rootviewcontroller = UIApplication.shared.windows.first?.rootViewController {
            
            self.oauthswift.authorizeURLHandler = SafariURLHandler(viewController: rootviewcontroller , oauthSwift: oauthswift)
        }
        
        
        
        self.oauthswift.authorize(withCallbackURL: "myapps://callback", scope: "user", state: "random_state") { result in
            
            
            switch result {
                
            case .success(let(credential,response,parameter)):
                
                print(credential.oauthToken)
                
                self.isauthorized = true
               
                
            case .failure(let error):
                print("oauth authentication failed \(error.localizedDescription)")
            }
            
            
        }
        
        
        
    }
    
    
    
    
}

#Preview {
    EntryView()
}
