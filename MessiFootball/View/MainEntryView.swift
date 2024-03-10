//
//  MainEntryView.swift
//  MessiFootball
//
//  Created by Saksham on 08/03/24.
//

import SwiftUI



struct MainEntryView: View {
    
    @State private var isShowSideMenu = false
    @State private var isloggedout = false
    @StateObject private var userinfo = Viewmodel()
    @State private var log = false
    
    var body: some View {
        if isloggedout{
            EntryView()
        }else{
            NavigationView {
                
                VStack {
                    TabView() {
                            
                            ContentView()
                                .transition(.move(edge: .leading))
                                .tabItem {
                                    
                                    Image(systemName: "play.house")
                                    Text("PL")
                                        .font(.largeTitle)
                                }.tag(0)
                            
                            
                            
                            PlStandingsView()
                                .tabItem {
                                    
                                    Image(systemName: "figure.australian.football")
                                    Text("standings")
                                }.tag(1)
                            
                            
                            LiveFixtures()
                                .tabItem {
                                    
                                    Image(systemName: "play")
                                    Text("matches")
                                }.tag(3)
                              
                        }
                    Text("")
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    isShowSideMenu.toggle()
                                }) {
                                    Image(systemName: "line.horizontal.3")
                                        .foregroundColor(.black)
                                }
                            }
                        }
                }
                
                .ignoresSafeArea()
             
                .background(Color.gray.opacity(0.2))
                
                
                
                
            }
            .navigationViewStyle(StackNavigationViewStyle()) // To prevent iPad-style navigation
            .sheet(isPresented: $isShowSideMenu)
            {
                SideMenu(islogggedout: $log)
                
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       MainEntryView()
    }
}
