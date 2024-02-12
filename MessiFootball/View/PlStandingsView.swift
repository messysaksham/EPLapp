//
//  PlStandingsView.swift
//  MessiFootball
//
//  Created by Saksham on 12/02/24.
//

import SwiftUI

struct PlStandingsView: View {
    
    @ObservedObject var standings = Viewmodel()
    
    let url  = BaseUrl.shared.getStandingsUrl()
    
    
    init(){
          standings.getPLStandings(url: url)
    }
    
    var body: some View {
        
        VStack{
            
            StandingTableCard()
        }
    }
}

#Preview {
    PlStandingsView()
}
