//
//  Viewmodel.swift
//  MessiFootball
//
//  Created by Saksham on 08/02/24.
//

import Foundation
import Alamofire
import Kingfisher

class Viewmodel : ObservableObject {
    
    static let shared = Viewmodel()
    
    @Published var footballmanager : FootballManager?
    @Published var Plstandings : PLStandings?
    @Published var LiveFixtures : Matches?
    @Published var user : User?
    
    

    
    let Specialtoken  = KeychainEx().retrievefromkeychainXauth() ?? "nodata"
    func getFootballData(url : URL){
        
        
        AF.request(url,method: .get,headers: ["X-Auth-Token":Specialtoken,"Content-Type" : "application/json"]).responseJSON { response in
            
            switch response.result {
                
                
            case .failure(let error):
                
                
                print(error.localizedDescription)
                
            case .success(_):
                
                
                
                if let response = response.data {
                    
                    
                    do{
                        let decoder =  try? JSONDecoder().decode(FootballManager.self, from: response)
                        
                        DispatchQueue.main.async{
                            
                            self.footballmanager = decoder
                            
                        }
                        
                    }
                    
                }else
                {
                    print("no response was received from the server")
                }
                
            }
            
        }
        
    }
    
    
    
    
    func getPLStandings(url : URL){
        
        
        AF.request(url,method: .get,headers: ["X-Auth-Token":Specialtoken,"Content-Type" : "application/json"]).responseJSON { response in
            
            switch response.result {
                
                
            case .failure(let error):
                
                
                print(error.localizedDescription)
                
            case .success( let value ):
               
                
                
                if let response = response.data {
                    
                    
                    do{
                        let decoder =  try? JSONDecoder().decode(PLStandings.self, from: response)
                        
                        DispatchQueue.main.async{
                            
                            self.Plstandings = decoder
                            
                        }
                        
                    }
                    
                    
                }else
                {
                    print("no response was received from the server")
                }
                
            }
            
        }
        
    }
    
    
    func getLiveFixtures(url : URL){
        
        
        AF.request(url,method: .get,headers: ["X-Auth-Token":Specialtoken,"Content-Type" : "application/json"]).responseJSON { response in
            
            switch response.result {
                
                
            case .failure(let error):
                
                
                print(error.localizedDescription)
                
            case .success(let value):
                
                print (value)
                
                if let response = response.data {
                    
                    
                    do{
                        let decoder =  try? JSONDecoder().decode(Matches.self, from: response)
                        
                        DispatchQueue.main.async{
                            
                            self.LiveFixtures = decoder
                            print("data inserted successfully")
                        }
                        
                    }
                    
                    
                }else
                {
                    print("no response was received from the server")
                }
                
            }
            
        }
        
    }
    
    
    
    func dateFormatter(date : String) -> Date? {
        
        let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                return dateFormatter.date(from: date)
            }
        
    
    
    func FetchGithubUserInfo(auth  : String){
        
        
        let url = URL(string: "https://api.github.com/user")!

        AF.request(url,method: .get,headers: ["Authorization":"Bearer \(auth)","Content-Type" : "application/json"]).responseJSON { response in
            
            switch response.result {
                
                
            case .failure(let error):
                
                
                print(error.localizedDescription)
                
            case .success(_):
                
                
                
                if let response = response.data {
                    
                    
                    do{
                        let decoder =  try? JSONDecoder().decode(User.self, from: response)
                        
                        DispatchQueue.main.async{ [self] in
                          
                            self.user = decoder
                            print(self.user?.login)
                            print(self.user?.avatar_url)
                            self.Newuser(username: self.user?.login ?? "yoo", avatar: user?.avatar_url ?? "yo")
                            
                            
                            
                        }
                       
                        
                    }
                    
                    
                }else
                {
                    print("no response was received from the server")
                }
                
            }
            
        }
            
    }
    
    
    
    func Newuser(username :  String , avatar : String){
        
        
        let parameters : [String: String] = [
                    
                    "name" : username,
                    "avatar" : avatar,
                   
                ]
                
                
                AF.request("http://localhost:3000/users",method:.post,parameters: parameters ,encoder:  JSONParameterEncoder.default ,headers: ["Content-Type": "application/json"]).responseJSON{response in
                    
                    
                    switch response.result {
                        
                    case .success(_) :
                        
                        print("successfully received response")
                        
                    case.failure(let error) :
                        print(error.localizedDescription)
                        
                    }
                    
                    
                    
                }
            }
        
        
        
        
    }
   
        
        
    
    
    

