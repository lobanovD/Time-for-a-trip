//
//  NetworkManager.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 02.06.2022.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static var ticketsArray: [ResultTicket] = []
    
    private let url = "https://travel.wildberries.ru/statistics/v1/cheap"
    
    // Получение данных
    func getDataFromJSON() {
        
        // проверяем URL
        guard let url = NSURL(string: url) else { print("url invalid"); return }
        
        // создаем сессию
        let session = URLSession.shared
        
        // создаем задачу запроса
        let task = URLRequest(url: url as URL)
        
        // инициализируем задачу
        session.dataTask(with: task) { data, responce, error in
            
            // проверяем, что пришел ответ
            guard responce != nil else {
                DispatchQueue.main.async {
                    FlightsListingVC().postDataError()
                }
                return
            }
            
            // проверяем, что пришла data
            guard let data = data else { print("data не пришла"); return }
 
            // декодируем JSON
            
            do {
                
                let tickets = try JSONDecoder().decode(Tickets.self, from: data)
                
                // сохраняем
                for ticket in tickets.data {
                    let resultTicket = ResultTicket(startCity: ticket.startCity,
                                                    startCityCode: ticket.startCityCode,
                                                    endCity: ticket.endCity,
                                                    endCityCode: ticket.endCityCode,
                                                    startDate: ticket.startDate,
                                                    endDate: ticket.endDate,
                                                    price: ticket.price,
                                                    searchToken: ticket.searchToken,
                                                    like: false)
                    NetworkManager.ticketsArray.append(resultTicket)
                }
                
                /* Отправляем уведомление, что загрузка закончена
                (для того чтобы индикатор немного задерживался на экране при быстром получении данных
                 добавлена задержка) */
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                    NotificationCenter.default.post(name: Notification.Name("getDataFinish"), object: nil)
                }
                                              
                                              
                                            
                
                
            } catch {}
        }.resume()
    }
}
