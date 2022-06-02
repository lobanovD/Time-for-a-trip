//
//  FlightsListingVC.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import UIKit
import TinyConstraints

final class FlightsListingVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Запуск UI
        setupUI()
        
        // Получение данных
        NetworkManager.shared.getDataFromJSON()
        
        // Наблюдатели
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTicketsTable), name: NSNotification.Name(rawValue: "updateLikes"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getDataError), name: NSNotification.Name(rawValue: "getDataError"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(getDataFinish), name: NSNotification.Name(rawValue: "getDataFinish"), object: nil)
    }
    
    // MARK: UI
    
    // Индикатор загрузки
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = ColorPalette.activityIndicator
        return activityIndicator
    }()
    
    // Таблица всех доступных билетов
    private lazy var flightsTableView: UITableView = {
        let flightsTableView = UITableView()
        flightsTableView.separatorStyle = .none
        flightsTableView.backgroundColor = ColorPalette.background
        return flightsTableView
    }()
    
    // MARK: Установка UI
    private func setupUI() {
        // Заголовок
        self.title = "Доступные билеты"
        // Фон
        view.backgroundColor = ColorPalette.background
        // Запуск анимации индикатора загрузки
        activityIndicator.startAnimating()
        // Добавление индикатора загрузки на экран
        view.addSubviews(activityIndicator)
        // Констрейнты индикатора загрузки
        activityIndicator.centerInSuperview()
    }
    
    // Настройки таблицы билетов
    private func configureFlightsTableView() {
        flightsTableView.delegate = self
        flightsTableView.dataSource = self
        flightsTableView.register(FlightsTableViewCell.self, forCellReuseIdentifier: FlightsTableViewCell.identifire)
    }
    
    // Метод обновления таблицы билетов
    @objc private func reloadTicketsTable() {
        flightsTableView.reloadData()
    }
    
    // Метод добавления таблицы билетов после загрузки данных
    @objc private func getDataFinish() {
        // Остановка индикации индикатора загрузки
        activityIndicator.stopAnimating()
        // Настройка таблицы билетов
        configureFlightsTableView()
        // Добавление таблицы билетов на экран
        view.addSubviews(flightsTableView)
        // Констрейнты таблицы билетов
        flightsTableView.edgesToSuperview(usingSafeArea: true)
    }
}


// MARK: Extensions
extension FlightsListingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.ticketsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlightsTableViewCell.identifire, for: indexPath) as! FlightsTableViewCell
        cell.createCell(cellId: indexPath.row)
        cell.backgroundColor = ColorPalette.background
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        CurrentTicketVC.cellID = indexPath.row
        let currentTicketVC = CurrentTicketVC()
        navigationController?.pushViewController(currentTicketVC, animated: true)
    }
}

extension FlightsListingVC {
    func postDataError() {
        NotificationCenter.default.post(name: Notification.Name("getDataError"), object: nil)
    }
    
    @objc func getDataError() {
        let alertVC = UIAlertController(title: "Ошибка", message: "Не удалось получить данные о билетах. Проверьте наличие сети!", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "ОК", style: .default) { _ in
            NetworkManager.shared.getDataFromJSON()
        }
        alertVC.addAction(alertAction)
        self.present(alertVC, animated: true)
    }
}
