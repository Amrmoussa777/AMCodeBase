//
//  File.swift
//  
//
//  Created by Amr Moussa on 24/08/2021.
//

import UIKit

open class AMTimePickerView: UIView {
    
    public let headerLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    public let timeLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    open var timePicker:UIDatePicker?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configurePicker()
        configureLyout()
        
    }
    
    open func configurePicker(){
        timePicker = UIDatePicker()
        timePicker?.date = Date()
        timePicker?.datePickerMode = .time
        if #available(iOS 13.4, *) {timePicker?.preferredDatePickerStyle = .compact} else {}
        timePicker?.locale = .current
        timePicker?.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configureLyout(){
        guard let timePicker = timePicker else {
            return
        }
        addSubViews(headerLabel,timePicker)
        translatesAutoresizingMaskIntoConstraints = false
        timePicker.translatesAutoresizingMaskIntoConstraints = false
        let padding:CGFloat = 10
        NSLayoutConstraint.activate([
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            headerLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            headerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            timePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            timePicker.centerYAnchor.constraint(equalTo: centerYAnchor)
            
            
        ])
        headerLabel.setText(text: "choose study reminder :")
        headerLabel.configureAsProfileHeadline()
        headerLabel.textColor  = .tertiaryLabel
        
    }
    
    
    @objc open func handleDateSelection(){
        print(timePicker?.date ?? "N/a")
    }
    
    
}

