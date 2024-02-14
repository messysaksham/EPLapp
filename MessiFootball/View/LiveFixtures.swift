//
//  LiveFixtures.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI

struct LiveFixtures: View {
    
    @ObservedObject var livematch = Viewmodel()
    let url = BaseUrl.shared.getStandingsUrl()
    var body: some View {
        Button{
            
            livematch.getLiveFixtures(url: url)
            
        }label: {
            Text("press this button to get response")
        }
    }
}

#Preview {
    LiveFixtures()
}
