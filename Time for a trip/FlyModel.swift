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
    
//          "startCity": "Москва",
//          "startCityCode": "mow",
//          "endCity": "Санкт-Петербург",
//          "endCityCode": "led",
//          "startDate": "2022-07-20T00:00:00Z",
//          "endDate": "2022-07-25T00:00:00Z",
//          "price": 2690,
//          "searchToken": "MOW2007LED2507Y100"
}


let fly1 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly2 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly3 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly4 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly5 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly6 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly7 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")
let fly8 = FlyModel(startCity: "Москва", startCityCode: "mow", endCity: "Санкт-Петербург", endCityCode: "led", startDate: "2022-07-20T00:00:00Z", endDate: "2022-07-25T00:00:00Z", price: 2690, searchToken: "MOW2007LED2507Y100")

let flyes: [FlyModel] = [fly1, fly2, fly3, fly4, fly5, fly6, fly7, fly8]


let array = [1...100]
