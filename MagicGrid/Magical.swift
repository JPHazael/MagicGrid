//
//  File.swift
//  MagicGrid
//
//  Created by admin on 4/24/17.
//  Copyright © 2017 JPDaines. All rights reserved.
//

import UIKit

protocol Magical {
    var cellViews: [String: UIView]{ get set }
    var selectedCell: UIView?{ get set }
}

extension UIColor{
    static func randomColor()-> UIColor{
        let red = Float(drand48())
        let green = Float(drand48())
        let blue = Float(drand48())
        
        return UIColor(colorLiteralRed: red , green: green, blue: blue, alpha: 1.0)
    }
}
