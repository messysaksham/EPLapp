//
//  BaseUrl.swift
//  MessiFootball
//
//  Created by Saksham on 10/02/24.
//

import Foundation


class BaseUrl {
    
    
    static let shared = BaseUrl()
    
    private init(){}
    
    func getbaseurl() -> URL {
        
        
        return URL(string: "https://api.football-data.org/v4/competitions/PL")!
        
    }
    
    
    func getStandingsUrl() -> URL {
        
        
        return URL(string: "https://api.football-data.org/v4/competitions/PL/standings")!
        
    }
    
    
    func getLiveFixturesUrl() -> URL {
        
        
        return URL(string: "https://api.football-data.org/v4/matches")!
        
    }
   
}



