//
//  ViewController.swift
//  myMovementView
//
//  Created by chunyili on 2018/11/22.
//  Copyright © 2018 chunyili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var mySlider = UISlider()
    var myView = UIView()
    var currentValue : Float = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        buildSlider()
        buildMovementView()
    }
    
    func buildMovementView(){
        let frame = CGRect(x: 0, y: view.bounds.maxY - 80, width: 50 , height: 50)
        myView = UIView(frame: frame)
        myView.backgroundColor = UIColor.black
        self.view.addSubview(myView)
    }
    
    func buildSlider(){
        let frame = CGRect(x: view.center.x - 100, y: view.center.y, width: 200, height: 20)
        mySlider = UISlider(frame: frame)
        mySlider.minimumValue = 0
        mySlider.maximumValue = 10
        mySlider.isContinuous = true
        mySlider.tintColor = UIColor.black
        mySlider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        self.view.addSubview(mySlider)
    }
    
    @objc
    func sliderValueChanged(_ slider : UISlider){
        guard slider.value >= 0 else{
            return
        }
        let changedValue = slider.value - currentValue
        
        let ratio = (self.view.frame.size.width - (myView.bounds.size.width)) / CGFloat(slider.maximumValue)
        var centerPoint = myView.center
        centerPoint = CGPoint(x: (centerPoint.x + CGFloat(changedValue) * ratio), y: centerPoint.y)
        myView.center = centerPoint
        self.currentValue = slider.value
    }

}

