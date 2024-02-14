//
//  LiveFixtures.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import SwiftUI
import Kingfisher

struct LiveFixtures: View {
    
    @ObservedObject var livematch = Viewmodel()
    let url = BaseUrl.shared.getLiveFixturesUrl()
    
    let kfimage = KFimage()
    
    
    
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
                                        
                                        VStack{
                                            Text(hometeam.tla ?? "hometeam")
                                            
                                        }
                                        
                                        if let imageURL = match.homeTeam?.crest{
                                            
                                            kfimage.getImage(url: imageURL)
                                            
                                        }
                                        
                                    
                                    }
                                    
                                    
                                    if match.status == "TIMED" {
                                        
                                        Text(match.formattedUTCDate ?? "")
                                    }else{
                                        
                                        Text(match.status ?? "no match")
                                        
                                    }
                                    
                                    if let imageURL = match.awayTeam?.crest{
                                        
                                        kfimage.getImage(url: imageURL)
                                        
                                    }
                                
                                    
                                    if let awayteam = match.awayTeam {
                                        
                                        
                                        Text(awayteam.tla ?? "hometeam")
                                        
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
