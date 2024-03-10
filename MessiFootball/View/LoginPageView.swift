

import SwiftUI
import Kingfisher
import KeychainAccess
import GoogleSignIn
import Firebase
import FirebaseAuth
import URLImage


struct LoginPageView: View {
    
    @State private  var username = ""
    @State private  var email = ""
    @EnvironmentObject var userinfo : Viewmodel
    
    var renderLogo: some View {
        VStack(spacing: 0){
            URLImage(URL(string: "https://raw.githubusercontent.com/coredxor/images/main/carot_login.png")!) { image in
                image
                    .resizable()
                    .frame(width : 50, height: 60, alignment: .leading)
            }
        }
        .frame(height: 60)
        .frame(maxWidth: .infinity)
        .padding(50)
    }
    
    var renderEmail: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Email")
                .foregroundColor(Color(hex: "#7C7C7C"))
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.bottom,8)
            TextField("", text: .constant("redxor@gmail.com"))
                .foregroundColor(Color(hex: "#181725"))
                .font(.system(size: 18))
                .frame(height: 22)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hex: "#ffffff"))
                .padding(.vertical,12)
            VStack(spacing: 0){
            }
            .frame(height: 1)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "#E2E2E2"))
        }
        .frame(height: 71)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical,16)
    }
    
    var renderPassword: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Password")
                .foregroundColor(Color(hex: "#7C7C7C"))
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.bottom,8)
            TextField("", text: .constant("*************"))
                .foregroundColor(Color(hex: "#181725"))
                .font(.system(size: 18))
                .frame(height: 22)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hex: "#ffffff"))
                .padding(.top,12)
                .padding(.bottom,8)
            VStack(spacing: 0){
            }
            .frame(height: 1)
            .frame(maxWidth: .infinity)
            .background(Color(hex: "#E2E2E2"))
        }
        .frame(height: 67)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical,16)
    }
    
    var renderButtonLogin: some View {
        VStack(spacing: 0){
            Spacer()
            Button{
                
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }
                
                let config = GIDConfiguration(clientID: clientID)
                
                GIDSignIn.sharedInstance.configuration = config
                
                GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { signResult, error in
                    
                    if let error = error {
                        print(error)
                        return
                    }
                    
                    guard let user = signResult?.user,
                          let idToken = user.idToken else { return }
                    
                    let accessToken = user.accessToken
                    
                    let credential = GoogleAuthProvider.credential(withIDToken: idToken.tokenString, accessToken: accessToken.tokenString)
                    
                    
                    Auth.auth().signIn(with: credential) { result, error in
                        
                        if let user = Auth.auth().currentUser {
                            
                            print("successfully signed in ")
                            
                            self.username = user.displayName ?? ""
                            
                            self.email = user.email ?? ""
                            
                            userinfo.Newuser(username: username, avatar: email)
                            
                            userinfo.isloggedin = true
                            
                        }
                        
                    }
                }
                
                
                
            }label: {
                Text("LOGIN")
            }.foregroundColor(Color(hex: "#FFF9FF"))
                .font(.system(size: 18))
                .fontWeight(.bold)
            Spacer()
        }
        .frame(height: 65)
        .frame(maxWidth: .infinity,alignment: .center)
        .background(Color(hex: "#53B175"))
        .cornerRadius(20)
        .padding(.vertical,20)
    }
    
    var renderCanSignup: some View {
        HStack(spacing: 0){
            Spacer()
            Text("Don’t have an account?")
                .foregroundColor(Color(hex: "#181725"))
                .font(.system(size: 14))
            Button(action: {}){
                Text("Signup")
                    .foregroundColor(Color(hex: "#53B175"))
                    .font(.system(size: 14))
            }
            Spacer()
        }
        .frame(height: 14)
        .frame(maxWidth: .infinity)
    }
    
    var body: some View {
        
        if userinfo.isloggedin {
            MainEntryView()
        }else{
            VStack(alignment: .leading, spacing: 0){
                ZStack{
                    URLImage(URL(string: "https://raw.githubusercontent.com/coredxor/images/main/bk_login.png")!) { image in
                        image
                            .resizable()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 0){
                        Group {
                            renderLogo
                            Text("Login")
                                .foregroundColor(Color(hex: "#181725"))
                                .font(.system(size: 26))
                                .fontWeight(.bold)
                            Text("Enter your email and password")
                                .foregroundColor(Color(hex: "#7C7C7C"))
                                .font(.system(size: 16))
                                .padding(.vertical,20)
                            renderEmail
                            renderPassword
                            
                            HStack(spacing: 0){
                                VStack(spacing: 0){}
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                Button(action: {}){
                                    Text("Forgot Password?")
                                        .foregroundColor(Color(hex: "#181725"))
                                        .font(.system(size: 14))
                                }
                            }
                            .frame(height: 14)
                            .frame(maxWidth: .infinity)
                            renderButtonLogin
                            renderCanSignup
                            Spacer()
                        }
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
            }
            .padding(.top,0.1)
            .padding(.bottom,0.1)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(hex: "#FFFFFF"))
        }
    }
}
        
     
extension Color {
        init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
    

#Preview {
    LoginPageView()
        
}
