//
//  File.swift
//  MagicGrid
//
//  Created by admin on 4/24/17.
//  Copyright © 2017 JPDaines. All rights reserved.
//

import UIKit

protocol Magical {
    var cellViews: [String: UIView]
    var selectedCell: UIView?
    
    func randomColor()-> UIColor
}
