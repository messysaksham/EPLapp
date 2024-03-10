
import SwiftUI
import FirebaseAuth


struct SideMenu : View {
    @State private var isMenuOpen = false
    @EnvironmentObject var users : Viewmodel
    @State private var isShowingLogoutAlert = false
    @Environment(\.presentationMode) var presentationMode
    @Binding var islogggedout : Bool
    
    private  let username = UserDefaults.standard.string(forKey: "username")
    private  let email = UserDefaults.standard.string(forKey: "email")
    
    var body: some View {
        
            NavigationView {
                VStack(alignment: .leading) {
                    Text(username ?? "unknown")
                        .font(.title)
                        .padding(.bottom, 20)
                    
                    Text(email ?? "unknown")
                        .padding(.bottom, 10)
                    
                    
                    Button(action: {
                        isShowingLogoutAlert = true
                        
                    }
                    ) {
                        Text("Logout")
                            .foregroundColor(.red)
                    }
                    .alert(isPresented: $isShowingLogoutAlert) {
                        Alert(title: Text("Logout"), message: Text("Are you sure you want to logout?"), primaryButton: .default(Text("Yes")) {
                            do {
                                try Auth.auth().signOut()
                                print ("successfully signed out")
                                
                                users.isloggedin = false
                                self.islogggedout = true
                                
                            } catch let signOutError as NSError {
                                
                                print("Error signing out: \(signOutError.localizedDescription)")
                            }
                            presentationMode.wrappedValue.dismiss()
                           
                        }, secondaryButton: .cancel())
                        
                    }
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Account Info")
            }
        }
    }

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        
        let mockViewModel = Viewmodel()
        return SideMenu( islogggedout: .constant(true))
            .environmentObject(mockViewModel)
    }
}
