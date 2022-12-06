//
//  MatchesResponse.swift
//  Carefer Task
//
//  Created by Abdo on 02/12/2022.
//

import Foundation

// MARK: - ProductDetailsResponse
struct MatchesResponse: Codable {
    let filters: Filters?
    let count: Int?
    let competition: Competition?
    let matches: [Match]?
}

// MARK: - Competition
struct Competition: Codable {
    let code: String?
    let id: Int?
    let area: Area?
    let name, plan, lastUpdated: String?
}

// MARK: - Area
struct Area: Codable {
    let id: Int?
    let name: String?
}

// MARK: - Filters
struct Filters: Codable {
}

// MARK: - Match
struct Match: Codable {
    let id: Int?
    let awayTeam: Area?
    let matchday: Int?
    let homeTeam: Area?
    let lastUpdated, stage: String?
    let odds: Odds?
    let referees: [Referee]?
    let season: Season?
//    let group: JSONNull?
    let score: Score?
    let utcDate, status: String?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}

// MARK: - Referee
struct Referee: Codable {
    let nationality: String?
    let id: Int?
    let name, role: String?
}

// MARK: - Score
struct Score: Codable {
    let halfTime, fullTime: Time?
    let winner: String?
//    let extraTime, penalties: ExtraTime?
    let duration: String?
}

// MARK: - ExtraTime
//struct ExtraTime: Codable {
//    let awayTeam, homeTeam: JSONNull?
//}

// MARK: - Time
struct Time: Codable {
    let awayTeam, homeTeam: Int?
}

// MARK: - Season
struct Season: Codable {
    let id: Int?
    let startDate, endDate: String?
    let currentMatchday: Int?
}
