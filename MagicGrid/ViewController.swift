//
//  ViewController.swift
//  MagicGrid
//
//  Created by admin on 4/19/17.
//  Copyright © 2017 JPDaines. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Magical {
    
    let numberOfViewsPerRow = 15
    
    var cellViews = [String: UIView]()
    var selectedCell: UIView? = nil


    override func viewDidLoad() {
    super.viewDidLoad()
        
        

        let width = view.frame.width / CGFloat(numberOfViewsPerRow)
        
        for j in 0...30{
            
            
        for i in 0...numberOfViewsPerRow{
            let redView = UIView()
            redView.backgroundColor = randomColor
            redView.layer.borderColor = UIColor.black.cgColor
            redView.layer.borderWidth = 1.0
            redView.frame = CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: 30, height: 30)
            
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
        
        

        
        guard let redView = cellViews[key] else {return}

        if selectedCell != redView{
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedCell?.layer.transform = CATransform3DIdentity
            }, completion: nil)
            
        }
        
        selectedCell = redView
        
        view.bringSubview(toFront: redView)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            redView.layer.transform = CATransform3DMakeScale(3, 3, 3)
        }, completion: nil)
        
        
        if gesture.state == .ended{
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                redView.layer.transform = CATransform3DIdentity
            }, completion: nil )
        }
        
    }
}

