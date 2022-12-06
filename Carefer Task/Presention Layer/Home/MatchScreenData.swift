//
//  MatchScreenData.swift
//  Carefer Task
//
//  Created by Abdo on 02/12/2022.
//

import Foundation

struct MatchScreenData: Identifiable, Codable, Comparable {
    var id: Int
    var scanDate: Date
    let title: String
    
    init(model: Match) {
        id = model.id ?? 0
        let matchDate = model.utcDate ?? ""
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formater.locale = Locale(identifier: "en")
        scanDate = formater.date(from: matchDate) ?? Date()
        
        if model.status == "SCHEDULED" {
            formater.timeStyle = .short
            let time = formater.string(from: scanDate)
            title = "\(model.homeTeam?.name ?? "") vs \(model.awayTeam?.name ?? "") SCHEDULED AT \(time)"
            
            
        } else {
            title = "\(model.homeTeam?.name ?? "") vs \(model.awayTeam?.name ?? ""), \(model.score?.fullTime?.homeTeam ?? 0) - \(model.score?.fullTime?.awayTeam ?? 0)"
        }
    }
    
    static func < (lhs: MatchScreenData, rhs: MatchScreenData) -> Bool {
        return lhs.scanDate < rhs.scanDate
    }
}
