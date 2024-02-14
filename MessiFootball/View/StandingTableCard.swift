//
//  StandingTableCard.swift
//  MessiFootball
//
//  Created by Saksham on 12/02/24.
//

import SwiftUI
import Kingfisher

struct StandingTableCard: View {
    
    @ObservedObject var standingcard = Viewmodel()
    
    @State private var crests : table?
    
    @State private var Isdetailscreen = false
    
    let url = BaseUrl.shared.getStandingsUrl()
    
    init(){
        
        standingcard.getPLStandings(url: url)
        
        
    }
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                
                
                
                VStack{
                    
                    
                    if let seasonNumber = standingcard.Plstandings?.filters?.season{
                        
                        Text("Premier League Season : \(seasonNumber) - 2024")
                        
                        HStack{
                            
                            Spacer()
                            Text("P")
                            Text("W")
                            Text("D")
                            Text("L")
                            Text("Pts")
                            
                            
                        }.padding()
                        
                        
                    }
                    
                    
                    
                    
                    
                    ScrollView(showsIndicators: false){
                        VStack(spacing : 20){
                            
                            VStack{
                                
                                
                                
                                
                                if let standings = standingcard.Plstandings?.standings{
                                    
                                    
                                    
                                    ForEach(standings, id: \.id) {stand in
                                        
                                        
                                        VStack(alignment: .leading){
                                            
                                            
                                            
                                            
                                            if let table = stand.table {
                                                
                                                
                                                ForEach(table, id:\.position) { pos in
                                                    NavigationLink(destination: DetailViewStandings(table: crests), isActive: $Isdetailscreen){
                                                        EmptyView()
                                                    }
                                                    
                                                    if let posi = pos.position {
                                                        
                                                        HStack{
                                                            
                                                            
                                                            Text ("\(posi)")
                                                            
                                                            
                                                            
                                                            if let team = pos.team{
                                                                
                                                                if let crestURL = team.crest{
                                                                    
                                                                    KFImage(URL(string: crestURL))
                                                                        .resizable()
                                                                        .frame(width: 30 ,height: 33)
                                                                        .cornerRadius(.pi)
                                                                    
                                                                    
                                                                    
                                                                    
                                                                    
                                                                }else{
                                                                    Text("no way")
                                                                }
                                                                
                                                                Text(team.shortName ?? "Pussy")
                                                                
                                                                Spacer(minLength: .nan)
                                                                
                                                                if let playedgames = pos.playedGames{
                                                                    
                                                                    Text("\(playedgames)")
                                                                }
                                                                
                                                                if let won = pos.won{
                                                                    
                                                                    Text("\(won)")
                                                                }
                                                                
                                                                
                                                                if let lost = pos.lost{
                                                                    
                                                                    Text("\(lost)")
                                                                }
                                                                
                                                                if let draw = pos.draw{
                                                                    
                                                                    Text("\(draw)")
                                                                }
                                                                if let points = pos.points{
                                                                    
                                                                    Text("\(points)")
                                                                    
                                                                }
                                                                
                                                                
                                                            }else{
                                                                
                                                                Text("no way")
                                                            }
                                                        }.padding()
                                                            .onTapGesture{
                                                                
                                                                self.crests = pos
                                                                Isdetailscreen = true
                                                            }
                                                    }else
                                                    
                                                    {
                                                        Text("what the fck")
                                                    }
                                                }
                                                
                                            }else{
                                                Text("novalue")
                                            }
                                        }
                                        
                                        
                                        
                                        
                                    }
                                }
                                
                            }.background(.white)
                            
                        }
                        
                    }.frame(width: 400, height: 600)
                }
            }
            
        }
    }
}


#Preview {
    StandingTableCard()
}
