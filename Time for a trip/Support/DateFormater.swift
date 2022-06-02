//
//  DateFormater.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 02.06.2022.
//

import Foundation

final class MyDateFormater {
    
    let shared = MyDateFormater()
    
    // Метод конвертации даты из json во время
    class func formatDateToTime(date: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let isoDate = isoFormatter.date(from: date)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH:mm"
        guard let isoDate = isoDate else { return "ошибка конвертации даты" }
        let currentTime = dateFormater.string(from: isoDate)
        return currentTime
    }
    // Метод конвертации даты из json во дату
    class func formatDateToDate(date: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let isoDate = isoFormatter.date(from: date)
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd:MM:yyyy"
        guard let isoDate = isoDate else { return "ошибка конвертации даты" }
        let currentTime = dateFormater.string(from: isoDate)
        return currentTime
    }
}
