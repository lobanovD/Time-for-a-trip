//
//  Models.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import Foundation

struct Tickets: Codable {
    let meta: Meta
    let data: [Ticket]
}

struct Ticket: Codable {
    let startCity: String
    let startCityCode: String
    let endCity, endCityCode: String
    let startDate, endDate: String
    let price: Int
    let searchToken: String
}

struct Meta: Codable {
}

struct ResultTicket: Codable {
    var startCity: String
    var startCityCode: String
    var endCity: String
    var endCityCode: String
    var startDate: String
    var endDate: String
    var price: Int
    var searchToken: String
    var like: Bool
}
