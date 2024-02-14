//
//  LiveFixtures.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI

struct LiveFixtures: View {
    
    @ObservedObject var livematch = Viewmodel()
    let url = BaseUrl.shared.getLiveFixturesUrl()
    
    
    
    init(){
        
        livematch.getLiveFixtures(url: url)
        
    }
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                ScrollView(showsIndicators : false){
                    
                    VStack(alignment: .leading, spacing : 50){
                        
                        if let Match = livematch.LiveFixtures?.matches {
                            
                            ForEach(Match, id: \.id) { match in
                                
                                HStack(alignment: .top, spacing : 50){
                                    
                                    if let hometeam = match.homeTeam {
                                        
                                        
                                        Text(hometeam.shortName ?? "hometeam")
                                        
                                    }
                                    
                                    
                                    if match.status == "TIMED" {
                                        
                                        Text("Yet to start")
                                    }else{
                                        
                                        Text(match.status ?? "no match")
                                        
                                    }
                                    
                                    
                                
                                    
                                    if let awayteam = match.awayTeam {
                                        
                                        
                                        Text(awayteam.shortName ?? "hometeam")
                                        
                                    }
                                    
                                }
                                
                                
                            }
                            
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }.padding()
                }
            }.navigationTitle("Today's Fixtures")
        }
    }
}
#Preview {
    LiveFixtures()
}
