//
//  CurrentTicketVC.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 01.06.2022.
//

import UIKit
import TinyConstraints

final class CurrentTicketVC: UIViewController {
    
    static var cellID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        print(CurrentTicketVC.cellID)
    }
    
    // MARK: UI
    
    // ID билета
    private lazy var idLabel: UILabel = {
        let idLabel = UILabel()
        idLabel.text = "№ билета: MOW2007LED2507Y100"
        idLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 18)
        return idLabel
    }()
    
    //  View билета "туда"
    private lazy var forwardTicketView: UIView = {
        let forwardTicketView = UIView()
        forwardTicketView.layer.borderWidth = 0.3
        forwardTicketView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        forwardTicketView.layer.cornerRadius = 10
        return forwardTicketView
    }()
    
    // Изображение самолета на билете "туда"
    private lazy var planeForward: UIImageView = {
        let planeForward = UIImageView(image: UIImage(named: "planeForward"))
        return planeForward
    }()
    
    // "Откуда" на билете "туда"
    private lazy var forwardFromLabel: UILabel = {
        let forwardFromLabel = UILabel()
        forwardFromLabel.text = "Откуда: "
        forwardFromLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return forwardFromLabel
    }()
    
    // Город отправления на билете "туда"
    private lazy var forwardStartCity: UILabel = {
        let forwardStartCity = UILabel()
        forwardStartCity.text = "Санкт-Петербург"
        forwardStartCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 22)
        return forwardStartCity
    }()
    
    // "Куда" на билете "туда"
    private lazy var forwardToLabel: UILabel = {
        let forwardToLabel = UILabel()
        forwardToLabel.text = "Куда: "
        forwardToLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return forwardToLabel
    }()
    
    // Город назначения на билете "туда"
    private lazy var forwardEndCity: UILabel = {
        let forwardEndCity = UILabel()
        forwardEndCity.text = "Нижний Новгород"
        forwardEndCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 22)
        return forwardEndCity
    }()
    
    // "Вылет" на билете "туда"
    private lazy var forwardDateLabel: UILabel = {
        let forwardDateLabel = UILabel()
        forwardDateLabel.text = "Вылет: "
        forwardDateLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return forwardDateLabel
    }()
    
    // Дата и время на билете "туда"
    private lazy var forwardDate: UILabel = {
        let forwardDate = UILabel()
        forwardDate.text = "28.10.2022 в 16:00"
        forwardDate.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return forwardDate
    }()
    
    
    //  View билета "обратно"
    private lazy var backTicketView: UIView = {
        let backTicketView = UIView()
        backTicketView.layer.borderWidth = 0.3
        backTicketView.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        backTicketView.layer.cornerRadius = 10
        return backTicketView
    }()
    
    // Изображение самолета на билете "обратно"
    private lazy var planeBack: UIImageView = {
        let planeBack = UIImageView(image: UIImage(named: "planeBack"))
        return planeBack
    }()
    
    // "Откуда" на билете "обратно"
    private lazy var backFromLabel: UILabel = {
        let backFromLabel = UILabel()
        backFromLabel.text = "Откуда: "
        backFromLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return backFromLabel
    }()
    
    // Город отправления на билете "обратно"
    private lazy var backStartCity: UILabel = {
        let backStartCity = UILabel()
        backStartCity.text = "Нижний Новгород"
        backStartCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 22)
        return backStartCity
    }()
    
    // "Куда" на билете "обратно"
    private lazy var backToLabel: UILabel = {
        let backToLabel = UILabel()
        backToLabel.text = "Куда: "
        backToLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return backToLabel
    }()
    
    // Город назначения на билете "обратно"
    private lazy var backEndCity: UILabel = {
        let backEndCity = UILabel()
        backEndCity.text = "Санкт-Петербург"
        backEndCity.font = UIFont(name: "AmericanTypewriter-Bold", size: 22)
        return backEndCity
    }()
    
    // "Вылет" на билете "обратно"
    private lazy var backDateLabel: UILabel = {
        let backDateLabel = UILabel()
        backDateLabel.text = "Вылет: "
        backDateLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return backDateLabel
    }()
    
    // Дата и время на билете "обратно"
    private lazy var backDate: UILabel = {
        let backDate = UILabel()
        backDate.text = "29.10.2022 в 21:25"
        backDate.font = UIFont(name: "AmericanTypewriter-Bold", size: 18)
        return backDate
    }()
    
    //  Label "Стоимость туда и обратно"
    private lazy var beforeCostLabel: UILabel = {
        let beforeCostLabel = UILabel()
        beforeCostLabel.text = "Стоимость туда и обратно: "
        beforeCostLabel.font = UIFont(name: "AmericanTypewriter-Light", size: 14)
        return beforeCostLabel
    }()
    
    // Цена
    private lazy var costLabel: UILabel = {
        let costLabel = UILabel()
        costLabel.text = "5140₽"
        costLabel.font = UIFont(name: "MarkerFelt-Wide", size: 30)
        costLabel.textColor = .red
        return costLabel
    }()
    
    // Кнопка лайка
    private lazy var likeButton: UIButton = {
        let likeButton = UIButton()
        if flyes[CurrentTicketVC.cellID!].like {
            likeButton.setImage(UIImage(named: "likeUp"), for: .normal)
        } else {
            likeButton.setImage(UIImage(named: "likeDown"), for: .normal)
        }
        
        likeButton.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
        return likeButton
    }()
    
    
    // Метод нажатия на кнопку лайка
    @objc private func tapLikeButton() {
        guard let cellID = CurrentTicketVC.cellID else { return }
        if flyes[cellID].like {
            likeButton.setImage(UIImage(named: "likeDown"), for: .normal)
            flyes[CurrentTicketVC.cellID!].like = false
        } else {
            likeButton.setImage(UIImage(named: "likeUp"), for: .normal)
            flyes[CurrentTicketVC.cellID!].like = true
        }
    }
    
    
    // MARK: Setup UI
    
    private func createUI() {
        
        // Background color
        view.backgroundColor = .white
        
        // Setup UI elements
        view.addSubviews(idLabel,
                         forwardTicketView,
                         backTicketView,
                         beforeCostLabel,
                         costLabel,
                         likeButton)
        
        forwardTicketView.addSubviews(planeForward,
                                      forwardFromLabel,
                                      forwardStartCity,
                                      forwardToLabel,
                                      forwardEndCity,
                                      forwardDateLabel,
                                      forwardDate)
        
        backTicketView.addSubviews(planeBack,
                                   backFromLabel,
                                   backStartCity,
                                   backToLabel,
                                   backEndCity,
                                   backDateLabel,
                                   backDate)
        
        // Setup constraints
        setupConstraints()
    }
    
    
    
    // MARK: Constraints
    private func setupConstraints() {
        
        // ID билета
        idLabel.centerXToSuperview()
        idLabel.topToSuperview(offset: 100)
        
        // Билет "туда"
        forwardTicketView.topToBottom(of: idLabel, offset: 10)
        forwardTicketView.leftToSuperview(offset: 16)
        forwardTicketView.rightToSuperview(offset: -16)
        forwardTicketView.height(200)
        
        planeForward.centerXToSuperview()
        planeForward.topToSuperview(offset: 10)
        planeForward.height(40)
        planeForward.width(60)
        
        forwardFromLabel.topToBottom(of: planeForward, offset: 20)
        forwardFromLabel.leftToSuperview(offset: 6)
        
        forwardStartCity.centerY(to: forwardFromLabel)
        forwardStartCity.centerXToSuperview()
        
        forwardToLabel.topToBottom(of: forwardFromLabel, offset: 20)
        forwardToLabel.leftToSuperview(offset: 6)
        
        forwardEndCity.centerY(to: forwardToLabel)
        forwardEndCity.centerXToSuperview()
        
        forwardDateLabel.topToBottom(of: forwardToLabel, offset: 20)
        forwardDateLabel.leftToSuperview(offset: 6)
        
        forwardDate.centerY(to: forwardDateLabel)
        forwardDate.centerXToSuperview()
        
        // Билет "обратно"
        backTicketView.topToBottom(of: forwardTicketView, offset: 10)
        backTicketView.leftToSuperview(offset: 16)
        backTicketView.rightToSuperview(offset: -16)
        backTicketView.height(200)
        
        planeBack.centerXToSuperview()
        planeBack.topToSuperview(offset: 10)
        planeBack.height(40)
        planeBack.width(60)
        
        backFromLabel.topToBottom(of: planeBack, offset: 20)
        backFromLabel.leftToSuperview(offset: 6)
        
        backStartCity.centerY(to: backFromLabel)
        backStartCity.centerXToSuperview()
        
        backToLabel.topToBottom(of: backFromLabel, offset: 20)
        backToLabel.leftToSuperview(offset: 6)
        
        backEndCity.centerY(to: backToLabel)
        backEndCity.centerXToSuperview()
        
        backDateLabel.topToBottom(of: backToLabel, offset: 20)
        backDateLabel.leftToSuperview(offset: 6)
        
        backDate.centerY(to: backDateLabel)
        backDate.centerXToSuperview()
        
        // Цена
        beforeCostLabel.topToBottom(of: backTicketView, offset: 20)
        beforeCostLabel.centerXToSuperview(offset: -60)
        
        costLabel.topToBottom(of: beforeCostLabel, offset: 6)
        costLabel.centerXToSuperview(offset: -60)
        
        // Кнопка Like
        likeButton.topToBottom(of: backTicketView, offset: 30)
        likeButton.centerXToSuperview(offset: 120)
        likeButton.height(40)
        likeButton.width(40)
    }
}
