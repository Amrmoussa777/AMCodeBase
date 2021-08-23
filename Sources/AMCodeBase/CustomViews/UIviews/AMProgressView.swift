//
//  ProgressView.swift
//  Educational
//
//  Created by Amr Moussa on 20/08/2021.
//

import UIKit

#warning("add to AM package")

open class AMProgressView: UIView {
    let circularView = CircularProgress()
    let percentLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 20)
    let footerLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 15)

    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLyout(){
        backgroundColor = .systemBackground
        RoundCorners()
        percentLabel.text = ""
        addSubViews(circularView,percentLabel,footerLabel)
        NSLayoutConstraint.activate([
            circularView.centerXAnchor.constraint(equalTo: centerXAnchor),
            circularView.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            circularView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            circularView.widthAnchor.constraint(equalTo:circularView.heightAnchor),
            
            footerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            footerLabel.topAnchor.constraint(equalTo: circularView.bottomAnchor),
            footerLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            footerLabel.widthAnchor.constraint(equalTo:circularView.widthAnchor),
            
            percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            percentLabel.topAnchor.constraint(equalTo: circularView.topAnchor),
            percentLabel.bottomAnchor.constraint(equalTo: circularView.bottomAnchor),
            percentLabel.widthAnchor.constraint(equalTo:percentLabel.heightAnchor),
        ])
        footerLabel.setText(text: "Progress")
        footerLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        footerLabel.textColor = .systemGray2
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    open func setPrecentage(percentage:Double){
        circularView.changePercentage(percentage: percentage)
        configurePercenLabel(percentage: percentage)
    }
    
    open func configurePercenLabel(percentage:Double){
        let perecnt =  String(Int(percentage * 100))
        let perecntAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.systemGreen ,
                                 NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)  ]
        let perecntString = NSAttributedString(string: perecnt, attributes: perecntAttribute)
        
        let perecntSign =  String("%")
        let perecntSignAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.systemGray,
                                     NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 20)]
        let perecntSignString = NSAttributedString(string: perecntSign, attributes: perecntSignAttribute)
        
        let combination = NSMutableAttributedString()
        combination.append(perecntString)
        combination.append(perecntSignString)
        
        percentLabel.attributedText = combination
    }
    
}


import UIKit


open class CircularProgress: UIView {
   public  let shapelayer = CAShapeLayer()
   public  let trackLayer = CAShapeLayer()
    
   open  var percentage:Double = 0 {
        didSet{
            configureLyout()
        }
    }
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureLyout()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureLyout(){
        translatesAutoresizingMaskIntoConstraints = false
        let radius:CGFloat = 30
        let centerPoint = CGPoint(x: self.bounds.midX, y: self.bounds.midX)
        let circularPath = UIBezierPath(arcCenter: centerPoint , radius: radius, startAngle: CGFloat(-Double.pi/2),
                                      endAngle:CGFloat(Double.pi * 2 * percentage - Double.pi/2), clockwise: true)
                                    shapelayer.path = circularPath.cgPath
       
        let trackPath = UIBezierPath(arcCenter: centerPoint, radius: radius, startAngle: -CGFloat.pi / 2,
                                     endAngle:   2 * CGFloat.pi, clockwise: true)
                                    trackLayer.path = trackPath.cgPath
        
        trackLayer.strokeColor = UIColor.systemGray6.cgColor
        trackLayer.lineWidth = 5
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        layer.addSublayer(trackLayer)

        shapelayer.strokeColor = UIColor.systemGreen.cgColor
        shapelayer.lineWidth = 7
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.lineCap = CAShapeLayerLineCap.round
        shapelayer.strokeEnd = 0
        layer.addSublayer(shapelayer)
        
        // animate circular shape inside track
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        shapelayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    open func changePercentage(percentage:Double){
        self.percentage = percentage
    }
    
}

