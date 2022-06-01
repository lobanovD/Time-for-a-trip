//
//  FlightsTableViewCell.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import UIKit
import TinyConstraints

class FlightsTableViewCell: UITableViewCell {
    
    static let identifire = "FlightsTableViewCell"

    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(mainView)
        mainView.addSubviews(centerLine,
                             planeForward,
                             planeBack,
                             startCity,
                             endCity,
                             idLabel,
                             startTime,
                             startDate,
                             endTime,
                             endDate,
                             costLabel,
                             likeImage)

        self.selectionStyle = .none
        setupConstraints()
    }
    
    // MARK: UI
    
    // Основное поле ячейки
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.borderWidth = 0.3
        mainView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    // ID билета
    private lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "MOW2007LED2507Y100"
        idLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 8)
        return idLabel
    }()
    
    // Вертикальная линия, разделяющая вылет и прилет
    private lazy var centerLine: UIView = {
        let centerLine = UIView()
        centerLine.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        centerLine.layer.borderWidth = 0.3
        return centerLine
    }()
    
    // Изображение самолета слева
    private lazy var planeForward: UIImageView = {
        let planeForward = UIImageView(image: UIImage(named: "planeForward"))
        return planeForward
    }()
    
    // Изображение самолета справа
    private lazy var planeBack: UIImageView = {
        let planeBack = UIImageView(image: UIImage(named: "planeBack"))
        return planeBack
    }()
    
    // Место отправления
    private lazy var startCity: UILabel = {
        let startCity = UILabel()
        startCity.text = "Санкт-Петербург"
//        startCity.text = "Москва"
        startCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return startCity
    }()
    
    // Место прибытия
    private lazy var endCity: UILabel = {
        let endCity = UILabel()
        endCity.text = "Нижний Новгород"
//        endCity.text = "Москва"
        endCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return endCity
    }()
    
    // Время отправления
    private lazy var startTime: UILabel = {
        let startTime = UILabel()
        startTime.text = "10:00"
        startTime.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return startTime
    }()
    
    // Дата отправления
    private lazy var startDate: UILabel = {
        let startDate = UILabel()
        startDate.text = "25.07.2022"
        startDate.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        return startDate
    }()
    
    // Время прибытия
    private lazy var endTime: UILabel = {
        let endTime = UILabel()
        endTime.text = "10:00"
        endTime.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return endTime
    }()
    
    // Дата прибытия
    private lazy var endDate: UILabel = {
        let endDate = UILabel()
        endDate.text = "25.07.2022"
        endDate.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        return endDate
    }()
    
    // Цена
    private lazy var costLabel: UILabel = {
        let costLabel = UILabel()
        costLabel.text = "5140₽"
        costLabel.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        costLabel.textColor = .red
        return costLabel
    }()
    
    // Иконка "Нравится"
    private lazy var likeImage: UIImageView = {
        let likeImage = UIImageView(image: UIImage(named: "likeDown"))
        return likeImage
    }()
    

    
    // MARK: Create cell
    

    
    
    // MARK: Constraints
    
    private func setupConstraints() {
        
        mainView.edgesToSuperview(insets: .top(5) + .left(16) + .right(16) + .bottom(5))
        
        centerLine.centerXToSuperview()
        centerLine.topToSuperview(offset: 10)
        centerLine.width(1)
        centerLine.height(70)
        
        planeForward.topToSuperview(offset: 8)
        planeForward.centerXToSuperview(offset: -40)
        planeForward.height(30)
        planeForward.width(40)
        
        planeBack.topToSuperview(offset: 8)
        planeBack.centerXToSuperview(offset: 40)
        planeBack.height(30)
        planeBack.width(40)
        
        startCity.centerYToSuperview()
        startCity.leftToSuperview(offset: 8)
        
        endCity.centerYToSuperview()
        endCity.rightToSuperview(offset: -8)
        
        idLabel.topToSuperview(offset: 6)
        idLabel.leftToSuperview(offset: 6)
        
        startTime.topToBottom(of: startCity)
        startTime.centerX(to: startCity)
        
        startDate.topToBottom(of: startTime)
        startDate.centerX(to: startCity)
        
        endTime.topToBottom(of: endCity)
        endTime.centerX(to: endCity)
        
        endDate.topToBottom(of: endTime)
        endDate.centerX(to: endCity)
        
        costLabel.topToSuperview(offset: 10)
        costLabel.rightToSuperview(offset: -10)
        
        likeImage.centerXToSuperview()
        likeImage.bottomToSuperview(offset: -6)
        likeImage.height(20)
        likeImage.width(20)
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
