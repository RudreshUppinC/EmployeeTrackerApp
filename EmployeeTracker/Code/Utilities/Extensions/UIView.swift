//
//  UIView.swift
//  SwiftNews
//
//  Created by DarkMoon on 04/11/22.
//

import UIKit

extension UIView {

    func addShadow(shadowColor: CGColor = UIColor.gray.cgColor,
                   shadowOffset: CGSize = CGSize(width: 0, height: -3),
                   shadowOpacity: Float = 0.6,
                   shadowRadius: CGFloat = 3,
                   cornerRadius: CGFloat = 20.0,
                   maskedCorners: CACornerMask =  [.layerMaxXMinYCorner, .layerMinXMinYCorner]) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = maskedCorners

    }
}

