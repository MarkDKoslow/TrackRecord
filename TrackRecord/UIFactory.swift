//
//  UIFactory.swift
//  TrackRecord
//
//  Created by Mark Koslow on 6/2/16.
//  Copyright © 2016 Mark Koslow. All rights reserved.
//

import UIKit

struct UIFactory {
    
    enum TypeFace {
        case GothamMedium
        case GothamBook
        
        var name: String {
            switch self {
            case .GothamBook: return "GothamBook"
            case .GothamMedium: return "GothamMedium"
            }
        }
    }
    
    enum FontSize {
        case Small
        case Medium
        case Large
        
        var fontSize: CGFloat {
            switch self {
            case .Small: return 12
            case .Medium: return 14
            case .Large: return 18
            }
        }
    }
    
    enum FactoryColors {
        case LightBlue
        case DeepBlue
        case Green
        case Orange
        case Red
        case White
        
        private var rgba: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
            switch self {
            case .LightBlue: return (84, 199, 252, 1)
            case .DeepBlue: return (46, 143, 255, 1)
            case .Green: return (10, 227, 0, 1)
            case .Orange: return (252, 223, 34, 1)
            case .Red: return (255, 0, 0, 1)
            case .White: return (255, 255, 255, 1)
            }
        }
        
        var color: UIColor {
            return UIColor(red: rgba.r / 255, green: rgba.g / 255, blue: rgba.b / 255, alpha: rgba.a)
        }
    }
}
