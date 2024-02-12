//
//  ContentView.swift
//  MessiFootball
//
//  Created by Saksham on 08/02/24.
//

import SwiftUI
import Kingfisher


struct ContentView: View {
    
    @State private var Isloading = true
    
    @State  var   crestURLs : seasons?
    
    @State private var navigatetonextScreen = false
    
    let url  = BaseUrl.shared.getbaseurl()
    
    
    @ObservedObject var ronaldo = Viewmodel()
    
    init(){
        
        ronaldo.getFootballData(url: url)
    }
    
    
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                
                if Isloading{
                    
                    ProgressView()
                    
                }else {
                    
                    ScrollView(showsIndicators: false){
                        VStack {
                            
                            Text(ronaldo.footballmanager?.name ?? "myboy")
                                .font(.title2)
                                .foregroundStyle(.white)
                            
                            
                            
                            if let ron = ronaldo.footballmanager {
                                
                                
                           
                                    
                                    ForEach(ron.seasons, id: \.id) {  season in
                                        
                                        
                                       
                                       
                                        
                                        HStack(spacing : 5){
                                            
                                            Text(season.startDate ?? "nothing")
                                                .padding()
                                            
                                            Text(season.endDate ?? "nothing")
                                                .padding()
                                            
                                            
                                            if let crest = season.winner?.crest {
                                                
                                                
                                                KFImage.url(URL(string: crest ))
                                                    .resizable()
                                                    .frame(width: 90, height: 100)
                                                
                                                
                                                
                                            }else{
                                                KFImage.url(URL(string: "https://assets.turbologo.com/blog/en/2020/01/19084654/Premier-League-logo.png" ))
                                                    .resizable()
                                                    .frame(width: 90, height: 100)
                                                    .cornerRadius(.infinity)
                                                
                                            }
                                            
                                            
                                            
                                            
                                        }.shadow(radius: 20)
                                            .background(ignoresSafeAreaEdges: .all)
                                            .foregroundColor(.black)
                                            .cornerRadius(20)
                                            .padding(.bottom, 5)
                                        
                                            .onTapGesture {
                                                self.crestURLs = season
                                                
                                                navigatetonextScreen = true
                                            }
                                        
                                        
                                    }
                                
                                NavigationLink(destination: TeamArea(Crest: crestURLs), isActive: $navigatetonextScreen){
                                    EmptyView()
                                    
                                }
                                    
                            }
                                    
                                }.padding()
                                
                                
                                
                            }
                        }
                        
                        
                        
                        
                    }.navigationTitle("PL Winners of All time")
                .background(Color.cyan)
                .edgesIgnoringSafeArea(.horizontal)
            
                .onAppear{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                        
                        
                        Isloading = false
                        
                        
                    }
                    
                }
            }
                    
                   
                }
        }
            
            
        

            
  

#Preview {
    ContentView()
}
