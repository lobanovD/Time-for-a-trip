//
//  Extensions.swift
//  Time for a trip
//
//  Created by Dmitrii Lobanov on 31.05.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        for subview in subviews {
            self.addSubview(subview)
        }
    }
}

extension UIColor {
    // Подключение Dark Mode
    static func createThemeColor(lightMode: UIColor, darkMode: UIColor) -> UIColor {
        guard #available(iOS 13.0, *) else { return lightMode }
        return UIColor { traitCollection -> UIColor in
            return traitCollection.userInterfaceStyle == .light ? lightMode : darkMode
        }
    }
    
    // Цвет в RGB
    class func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ alpha: CGFloat) -> UIColor {
        let color = UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
        return color
    }
}
