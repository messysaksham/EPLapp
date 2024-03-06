//
//  SlideView.swift
//  MessiFootball
//
//  Created by Saksham on 04/03/24.
//

import SwiftUI
import SlidingTabView

struct SlideView: View {
    
    
    @State private var dumbell = 0
    
    var body: some View {
        
    
        VStack(alignment : .center){
            SlidingTabView(selection: $dumbell, tabs: ["EPL","LALIGA","SERIA"], font: .caption2, animation: .easeInOut, activeAccentColor: .purple, inactiveAccentColor: .black, selectionBarColor: .clear, inactiveTabColor: .clear, activeTabColor: .white, selectionBarHeight: .pi, selectionBarBackgroundColor: .clear, selectionBarBackgroundHeight: .pi)
           
            
            Spacer()
            
            if dumbell == 0 {
                
                PlStandingsView()
                
            }
            if dumbell == 1 {
                
                ContentView()
                
            }
            
            if dumbell == 2 {
                
                
                LiveFixtures()
                
            }
            
            
        }
    }
}

#Preview {
    SlideView()
}
