//
//  TestView.swift
//  Kudo
//
//  Created by Philip Ekman on 31/01/16.
//  Copyright © 2016 Philip Ekman. All rights reserved.
//

import UIKit
@IBDesignable

class TestView: UIView {
    
    var view: UIView!
    var circle:UIView!
    
    
    @IBOutlet weak var theLabel: UILabel!
    
    @IBInspectable var title: String = "" {
        didSet {
            self.theLabel.text = title
        }
    }
    
    @IBInspectable var theBackground:UIColor = UIColor.redColor() {
        
        didSet {
            self.view!.backgroundColor = theBackground
        }
        
    }
    
    @IBInspectable var theProgress:CGFloat = 0.5 {
        didSet {
            setupProgressBar(theProgress)
        }
    }
    
    @IBInspectable var active: Bool = false {
        didSet {
            if active {
                theLabel.textColor = UIColor.whiteColor()
            } else {
                theLabel.textColor = UIColor.blackColor()
            }
        }
    }
    
    func xibSetup() {
        view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
    }
    
    func setupProgressBar(progres:CGFloat) {
        
        circle = UIView(frame: CGRectMake(0,0, 200, 200))
        
        circle.layoutIfNeeded()
        
        var progressCircle = CAShapeLayer()
        
        let centerPoint = CGPoint (x: circle.bounds.width / 2, y: circle.bounds.width / 2)
        let circleRadius : CGFloat = circle.bounds.width / 2 * 0.8
        
        let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: CGFloat(-0.5 * M_PI), endAngle: CGFloat(1.5 * M_PI), clockwise: true)
        progressCircle = CAShapeLayer ()
        progressCircle.path = circlePath.CGPath
        progressCircle.strokeColor = UIColor.whiteColor().CGColor
        progressCircle.fillColor = UIColor.clearColor().CGColor
        progressCircle.lineWidth = 8
        progressCircle.strokeStart = 0
        progressCircle.strokeEnd = progres
        
        circle.layer.addSublayer(progressCircle)
        
        self.view.addSubview(circle)
        
    }
    
    func loadViewFromNib() -> UIView {
        
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "TestView", bundle: bundle)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
    }

}
