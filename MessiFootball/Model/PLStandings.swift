

import Foundation


struct PLStandings: Codable {
    let filters: filters?
    let competition: competition?
    let season: season?
    let standings: [standings]?
}




struct competition: Codable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}


struct filters: Codable {
    let season: String?
}


struct season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: String?
}


struct standings: Codable,Identifiable {
    var id :  UUID?
    let stage, type: String?
    let group: String?
    let table: [table]?
}


struct table: Codable {
    var id : UUID?
    let position: Int?
    let team: team?
    let playedGames: Int?
    let form: String?
    let won, draw, lost, points: Int?
    let goalsFor, goalsAgainst, goalDifference: Int?
}


struct team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}
