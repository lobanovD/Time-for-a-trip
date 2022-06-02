//
//  FlyModel.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import Foundation

struct FlyModel {
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

var fly1 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "123456",  like: false)
var fly2 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Нижний Новгород", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "4546678",  like: false)



var flyes: [FlyModel] = [fly1, fly2]



