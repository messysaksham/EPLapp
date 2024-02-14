//
//  Matches.swift
//  MessiFootball
//
//  Created by Saksham on 14/02/24.
//

import Foundation


struct Matches: Codable {
    let filters: Filters?
    let resultSet: ResultSet?
    let matches: [Match]?
}

// MARK: - Filters
struct Filters: Codable {
    let dateFrom, dateTo, permission: String?
}

// MARK: - Match
struct Match: Codable {
    let area: Area?
    let competition: Competition?
    let season: Season?
    let id: Int?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let group: String?
    let lastUpdated: String?
    let homeTeam, awayTeam: Team?
    let score: Score?
    let odds: Odds?
    let referees: [String]?
}

// MARK: - Area
struct Area: Codable {
    let id: Int?
    let name, code: String?
    let flag: String?
}

// MARK: - Team
struct Team: Codable {
    let id: Int?
    let name, shortName, tla: String?
    let crest: String?
}

// MARK: - Competition
struct Competition: Codable {
    let id: Int?
    let name, code, type: String?
    let emblem: String?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}

// MARK: - Score
struct Score: Codable {
    let winner: String?
    let duration: String?
    let fullTime, halfTime, penalties: FullTime?
}

// MARK: - FullTime
struct FullTime: Codable {
    let home, away: Int?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
    let winner: String?
}

// MARK: - ResultSet
struct ResultSet: Codable {
    let count: Int?
    let competitions, first, last: String?
    let played: Int?
}
