//
//  FlightsTableViewCell.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import UIKit
import TinyConstraints

final class FlightsTableViewCell: UITableViewCell {
    
    static let identifire = "FlightsTableViewCell"
    
    var tapLike : (()->())?
    
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
                             likeImageButton)
        
        self.selectionStyle = .none
        setupConstraints()
    }
    
    // MARK: UI
    
    // Основное поле ячейки
    private lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.layer.borderWidth = 0.3
        mainView.layer.borderColor = ColorPalette.ticketBorder.cgColor
        mainView.layer.cornerRadius = 10
        return mainView
    }()
    
    // ID билета
    private lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 8)
        return idLabel
    }()
    
    // Вертикальная линия, разделяющая вылет и прилет
    private lazy var centerLine: UIView = {
        let centerLine = UIView()
        centerLine.layer.borderColor = ColorPalette.ticketBorder.cgColor
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
        startCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return startCity
    }()
    
    // Место прибытия
    private lazy var endCity: UILabel = {
        let endCity = UILabel()
        endCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 16)
        return endCity
    }()
    
    // Время отправления
    private lazy var startTime: UILabel = {
        let startTime = UILabel()
        startTime.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return startTime
    }()
    
    // Дата отправления
    private lazy var startDate: UILabel = {
        let startDate = UILabel()
        startDate.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        return startDate
    }()
    
    // Время прибытия
    private lazy var endTime: UILabel = {
        let endTime = UILabel()
        endTime.font = UIFont(name: "AmericanTypewriter-Bold", size: 20)
        return endTime
    }()
    
    // Дата прибытия
    private lazy var endDate: UILabel = {
        let endDate = UILabel()
        endDate.font = UIFont(name: "AmericanTypewriter-Light", size: 10)
        return endDate
    }()
    
    // Цена
    private lazy var costLabel: UILabel = {
        let costLabel = UILabel()
        costLabel.font = UIFont(name: "MarkerFelt-Wide", size: 20)
        costLabel.textColor = ColorPalette.price
        return costLabel
    }()
    
    // Кнопка "Нравится"
    private lazy var likeImageButton: UIButton = {
        let likeImage = UIButton()
        likeImage.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
        return likeImage
    }()
    @objc func tapLikeButton() {
        tapLike?()
    }
    
    // MARK: Наполнение ячейки
    func createCell(cellId: Int) {
        idLabel.text = NetworkManager.ticketsArray[cellId].searchToken
        startCity.text = NetworkManager.ticketsArray[cellId].startCity
        endCity.text = NetworkManager.ticketsArray[cellId].endCity
        let sTime = MyDateFormater.formatDateToTime(date: NetworkManager.ticketsArray[cellId].startDate)
        startTime.text = sTime
        let sDate = MyDateFormater.formatDateToDate(date: NetworkManager.ticketsArray[cellId].startDate)
        startDate.text = sDate
        let eTime = MyDateFormater.formatDateToTime(date: NetworkManager.ticketsArray[cellId].endDate)
        endTime.text = eTime
        let eDate = MyDateFormater.formatDateToDate(date: NetworkManager.ticketsArray[cellId].endDate)
        endDate.text = eDate
        costLabel.text = String("\(NetworkManager.ticketsArray[cellId].price) ₽")
        
        if NetworkManager.ticketsArray[cellId].like {
            likeImageButton.setImage(UIImage(named: "likeUp"), for: .normal)
        } else {
            likeImageButton.setImage(UIImage(named: "likeDown"), for: .normal)
        }
    }
    
    // MARK: Констрейнты
    
    private func setupConstraints() {
        
        mainView.edgesToSuperview(insets: .top(5) + .left(16) + .right(16) + .bottom(5))
        
        idLabel.topToSuperview(offset: 6)
        idLabel.leftToSuperview(offset: 6)
        
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
        
        startTime.topToSuperview(offset: 65)
        startTime.leftToSuperview(offset: contentView.frame.width / 4 - 24)
        
        startDate.topToBottom(of: startTime)
        startDate.centerX(to: startTime)
        
        startCity.centerYToSuperview()
        startCity.centerX(to: startTime)
        
        endTime.topToSuperview(offset: 65)
        endTime.rightToSuperview(offset: -contentView.frame.width / 4 + 24)
        
        endDate.topToBottom(of: endTime)
        endDate.centerX(to: endTime)
        
        endCity.centerYToSuperview()
        endCity.centerX(to: endTime)
        
        costLabel.topToSuperview(offset: 10)
        costLabel.rightToSuperview(offset: -10)
        
        //        likeImage.centerXToSuperview()
        //        likeImage.bottomToSuperview(offset: -6)
        //        likeImage.height(20)
        //        likeImage.width(20)
        
        likeImageButton.centerXToSuperview()
        likeImageButton.bottomToSuperview(offset: -6)
        likeImageButton.height(20)
        likeImageButton.width(20)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
