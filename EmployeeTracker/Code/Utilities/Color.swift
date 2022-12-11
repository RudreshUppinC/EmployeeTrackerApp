//
//  Color.swift
//  SwiftNews
//
//  Created by DarkMoon on 03/11/22.
//

import Foundation
import UIKit

enum MyColor {
    case InActiveStatus
    case ActiveStatus
}

extension MyColor {
    var value: UIColor {
        get {
            switch self {
            case .InActiveStatus:
                return UIColor(red: 2/255, green: 191/255, blue: 55/255, alpha: 1.0)
            case .ActiveStatus:
                return UIColor(red: 176/255, green: 1/255, blue: 1/255, alpha: 1.0)
            }
        }
    }
}
