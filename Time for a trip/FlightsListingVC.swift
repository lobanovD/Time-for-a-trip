//
//  FlightsListingVC.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import UIKit
import TinyConstraints

final class FlightsListingVC: UIViewController {
    
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: UI
    
    // Table of flights
    private lazy var flightsTableView: UITableView = {
        let flightsTableView = UITableView()
        flightsTableView.separatorStyle = .none
        return flightsTableView
    }()
    
    // MARK: Setup UI
    private func setupUI() {
        self.title = "Доступные билеты"
        
        // Background color
        view.backgroundColor = .white
        // Configure table view
        configureFlightsTableView()
        // Adding Subviews
        view.addSubviews(flightsTableView)
        // Constraints
        setupConstraints()
    }
    
    // Configure table view
    private func configureFlightsTableView() {
        flightsTableView.delegate = self
        flightsTableView.dataSource = self
        flightsTableView.register(FlightsTableViewCell.self, forCellReuseIdentifier: FlightsTableViewCell.identifire)
    }
    
    // MARK: Constraints
    
    // All constraints
    private func setupConstraints() {
        flightsTableView.edgesToSuperview()
    }
}


// MARK: Extensions
extension FlightsListingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FlightsTableViewCell.identifire, for: indexPath) as! FlightsTableViewCell
        
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentTicketVC = CurrentTicketVC()
        navigationController?.pushViewController(currentTicketVC, animated: true)
    }
    
}


