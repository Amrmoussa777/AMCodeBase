//
//  File.swift
//  
//
//  Created by Amr Moussa on 24/08/2021.
//

import UIKit

open class AMTimePickerView: UIView{
    
    public let headerLabel = AMItemLable(textAlignment: .center, NoOfLines: 1, size: 20)
    public let timeLabel = AMItemLable(textAlignment: .left, NoOfLines: 1, size: 20)
    open var timePicker:UIDatePicker?
    open var datePickerConstraints = [NSLayoutConstraint]()
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
        timePicker?.addTarget(self, action: #selector(handleDateTapped), for: .touchUpInside)
        timePicker?.tintColor = .systemGreen
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
            
            timePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            timePicker.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: padding),
            timePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            timePicker.heightAnchor.constraint(equalToConstant: 50),
        ])
        headerLabel.setText(text: "اختر وقت تذكير بالمذاكرة")
        headerLabel.configureAsProfileHeadline()
    }
    
    
    
    private func updateDatePickerConstraints() {
        guard let datePicker = timePicker else { return }
        
        // Remove any previously set constraints.
        self.removeConstraints(datePickerConstraints)
        datePickerConstraints.removeAll()
        
        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: centerYAnchor))
        datePickerConstraints.append(datePicker.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8))
        datePickerConstraints.append(datePicker.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8))
        
        // Activate all constraints.
        NSLayoutConstraint.activate(datePickerConstraints)
    }
    
    @objc open func handleDateSelection(){
        print(timePicker?.date.timeIntervalSince1970 ?? "N/a")
    }
    
    
    @objc open func handleDateTapped(){
        updateDatePickerConstraints()
    }
    
    
}

