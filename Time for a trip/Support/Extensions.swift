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
