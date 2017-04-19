//
//  ViewController.swift
//  MagicGrid
//
//  Created by admin on 4/19/17.
//  Copyright © 2017 JPDaines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numberOfViewsPerRow = 10
    
    var cellViews = [String: UIView]()


    override func viewDidLoad() {
    super.viewDidLoad()
        
        
        let numberOfViewsPerRow = 10
        let width = view.frame.width / CGFloat(numberOfViewsPerRow)
        
        for j in 0...20{
            
            
        for i in 0...numberOfViewsPerRow{
            let redView = UIView()
            redView.backgroundColor = randomColor()
            redView.layer.borderColor = UIColor.black.cgColor
            redView.layer.borderWidth = 1.0
            redView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: 100, height: 100)
            
            view.addSubview(redView)
            
            
            let key = "\(i) \(j)"
            cellViews[key] = redView
            
            }
            
        }
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
    }
    
    
    func handlePan(gesture: UIPanGestureRecognizer){
        let location = gesture.location(in: view)
        print(location)
        
        let width = view.frame.width / CGFloat(numberOfViewsPerRow)

        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print(i, j)
        
        
        let key = "\(i) \(j)"

        
        let redView = cellViews[key]
        redView?.backgroundColor = .white
        
        
//        var loopCount = 0
//        for subview in view.subviews{
//            
//            if subview.frame.contains(location){
//            
//            subview.backgroundColor = .black
//                //print("loop count = \(loopCount)")
//                
//            }
//            loopCount += 1
//        }
        
    }
    private func randomColor()-> UIColor{
        let red = Float(drand48())
        let green = Float(drand48())
        let blue = Float(drand48())
        
        return UIColor(colorLiteralRed: red , green: green, blue: blue, alpha: 1.0)
    }


}

