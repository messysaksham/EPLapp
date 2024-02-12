//
//  NetworkManager.swift
//  MessiFootball
//
//  Created by Saksham on 12/02/24.
//

import Foundation
import  Alamofire


class NetworkManager {
    
    
    static let network = NetworkManager()
    @Published var footballmanager : FootballManager?
    let Specialtoken  = BaseUrl.shared.getXauthToken()
    private init(){}
    
    
    
    
    
    
    func getNetworkback(url : URL) -> DataRequest?{
        
        
       return AF.request(url,method: .get,headers: ["X-Auth-Token":Specialtoken,"Content-Type" : "application/json"]).responseJSON { response in
            
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
    
    
}
