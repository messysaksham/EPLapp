//
//  FootballManager.swift
//  MessiFootball
//
//  Created by Saksham on 08/02/24.
//

import Foundation


struct FootballManager: Codable,Identifiable {
    
    
    let id: Int?
    let name, code, type: String?
    let emblem : String?
    let seasons : [seasons]
    let area : area?
    let currentSeason: seasons?
}



struct seasons: Codable,Identifiable{
    
    let id : Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner : winner?
    
}


struct area: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

struct winner: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
    let address: String?
    let website: String?
    let founded: Int?
    let venue: String?
    let lastUpdated: String?
}
