//
//  TabView.swift
//  MessiFootball
//
//  Created by Saksham on 12/02/24.
//

import SwiftUI

struct TabbView: View {
    
    @State private var transition = false
    
    var body: some View {
        
   
            TabView {
                
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
                        Text("standings")
                    }.tag(1)
                  
            }
        }
        
    
}

#Preview {
    TabbView()
}
