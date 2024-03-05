//
//  TeamArea.swift
//  MessiFootball
//
//  Created by Saksham on 10/02/24.
//

import SwiftUI
import Kingfisher
import MapKit
struct TeamArea: View {
    
    let Crest : seasons?
    @State private var viewappear = true
    
    var body: some View {
        ZStack{
            ScrollView{
                VStack(spacing : 20){
                    VStack(alignment: .leading){
                        
                        
                        AsyncImage(url: URL(string: Crest?.winner?.crest ?? "")){ image in
                            
                            switch image {
                                
                            case .failure :
                                ProgressView()
                                
                            case .success(let image) :
                                
                                
                                VStack{
                                    
                                    image
                                        .resizable()
                                        .frame(width : 150 , height: 150)
                                        .cornerRadius(.infinity)
                                        .padding()
                                    
                                    
                                    if      let  founded = Crest?.winner?.founded{
                                        
                                        Text("Founded in : \(String(format : "%d",founded))")
                                            .font(.headline)
                                        
                                    }
                                    
                                    if  let  website = Crest?.winner?.website {
                                        
                                        Text("Website: \(website)")
                                            .font(.callout)
                                        
                                    }
                                    if let venue = Crest?.winner?.venue{
                                        
                                        
                                        Text("Venue: \(venue)")
                                            .font(.callout)
                                            .italic()
                                        
                                    }
                                    
                                }
                                .frame(width: 240,height: 625)
                                .edgesIgnoringSafeArea(.all)
                                
                                Spacer()
                                
                                
                            case .empty:
                                
                                ProgressView()
                                
                                
                            @unknown default:
                                Text("This is a unknown error")
                            }
                            
                        }
                        
                    }
                    
                    
                    VStack{
                        Map()
                    }.frame(width:500,height: 400)
                        .padding()
                    
                }
            }
        }   .edgesIgnoringSafeArea(.all)
            
    }
    
}




#Preview {
    TeamArea(Crest: seasons.init(id: 22, startDate: "22", endDate: "22", currentMatchday: 23, winner: winner(id: 1, name: "rr", shortName: "rr", tla: "ee", crest: "ww", address: "ww", website: "ww", founded: 22, venue: "ss", lastUpdated: "ss")))
}
