//
//  ViewController.swift
//  AnimatedCircularProgressBar
//
//  Created by Marco Falanga on 20/04/18.
//  Copyright © 2018 Marco Falanga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progress: Double = 0.0
    var color: UIColor = UIColor()
    var progressLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        //Progress has to be a value in a range of 0 and 1
        progress = 0.5321
        
        //Setup the color of your progress here
        
        color = /*#-editable-code*/#colorLiteral(red: 0.9921568627, green: 0.7215686275, blue: 0.1529411765, alpha: 1)/*#-end-editable-code*/
        
        //Setup label showing the progress percentage in the middle of the screen
        progressLabel.textAlignment = .center
        progressLabel.numberOfLines = 0
        
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressLabel)
        
        progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        setupProgress()
    }
    
    func setupProgress() {
        let shapeLayer = CAShapeLayer()
        let trackLayer = CAShapeLayer()
        
        let progressStringed = String(format: "%.2f", progress * 100)
        progressLabel.text = "Progress:\n\n\(progressStringed)%"
        progressLabel.textColor = color
        
        if progress != 0.0 {
            progressLabel.isHidden = false
            
            trackLayer.isHidden = false
            shapeLayer.isHidden = false
            
            let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
            
            basicAnimation.toValue = progress
            basicAnimation.duration = 1
            basicAnimation.fillMode = kCAFillModeForwards
            basicAnimation.isRemovedOnCompletion = false
            shapeLayer.add(basicAnimation, forKey: "animation")
            
            let circularPath = UIBezierPath(arcCenter: CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY), radius: UIScreen.main.bounds.height * 0.15, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi - CGFloat.pi/2, clockwise: true)
    
            trackLayer.path = circularPath.cgPath
            trackLayer.strokeColor = color.cgColor
            trackLayer.lineWidth = 8
            trackLayer.lineCap = kCALineCapRound
            trackLayer.fillColor = UIColor.clear.cgColor
            trackLayer.opacity = 0.3
            view.layer.addSublayer(trackLayer)
            
            
            shapeLayer.path = circularPath.cgPath
            
            
            shapeLayer.strokeColor = color.cgColor
            shapeLayer.lineWidth = 10
            shapeLayer.lineCap = kCALineCapRound
            shapeLayer.strokeEnd = 0
            shapeLayer.fillColor = UIColor.clear.cgColor
            
            view.layer.addSublayer(shapeLayer)
        }
    }
}

