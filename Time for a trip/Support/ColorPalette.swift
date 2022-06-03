//
//  ColorPalette.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 03.06.2022.
//

import Foundation
import UIKit

struct ColorPalette {
    static var background = UIColor.createThemeColor(lightMode: .white, darkMode: UIColor.rgb(37, 39, 38, 1))    
    static var activityIndicator = UIColor.createThemeColor(lightMode: .black, darkMode: .white)
    static var price = UIColor.createThemeColor(lightMode: UIColor.rgb(221, 53, 46, 1), darkMode: UIColor.rgb(221, 53, 46, 1))
    static var navigationBarItem = UIColor.createThemeColor(lightMode: .black, darkMode: .white)
    static var ticketBorder = UIColor.createThemeColor(lightMode: .systemGray, darkMode: .systemGray)
}
