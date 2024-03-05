//
//  EntryView.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI
import Kingfisher
import OAuthSwift
import KeychainAccess


struct EntryView: View {
    
    private var consumer = KeychainEx()
    private var userinfo = Viewmodel()
    
    @State var  isauthorized = false
    
    let url = URL(string: "https://cdn.freelogovectors.net/wp-content/uploads/2023/04/premier-league-logo-01-freelogovectors.net_.png")
    
    
    private let consumersecrettt : String
    private let consumerkey = "1a43b6eca6543260ddd9"
    
    private let oauthswift: OAuth2Swift
    
    init() {
        self.consumersecrettt = consumer.retrievefromKeychain() ?? "nodata"
        self.oauthswift = OAuth2Swift(consumerKey:consumerkey,
                                      consumerSecret: consumersecrettt,
                                      authorizeUrl: "https://github.com/login/oauth/authorize",
                                      accessTokenUrl: "https://github.com/login/oauth/access_token",
                                      responseType: "code")
    }
    
    
    var body: some View {
        
        
        
        if isauthorized {
            SlideView()
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
                
                let authtoken = credential.oauthToken
                
                print (authtoken)
                
                
                self.isauthorized = true
                userinfo.FetchGithubUserInfo(auth: authtoken)
                
            case .failure(let error):
                print("oauth authentication failed \(error.localizedDescription)")
            }
            
        }
    }
    
    
    
}

#Preview {
    EntryView()
}
