//
//  RatingView.swift
//  sharex
//
//  Created by Amr Moussa on 01/07/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//


import UIKit
import SwiftUI

open class RatingUIView: UIView {
    
    
    open var swiftUIView:RatingView!
    private var model = RatingModel(rating: 1)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(rating:Int){
        super.init(frame: .zero)
        
        addRating(rating: rating)
    }
    
    open  func configure(){
        swiftUIView = RatingView(rating: model)
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        hostingController.view.backgroundColor = .none
        addSubview(hostingController.view)
        
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        
        let constraints = [
            hostingController.view.topAnchor.constraint(equalTo: self.topAnchor),
            hostingController.view.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
            self.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
   open  func addRating(rating:Int = 1){
        
        model.rawValue = rating
        
    }
    
    
}

open class RatingModel: ObservableObject {
    
    @Published open var rawValue: Int
    
    public init(rating: Int) {
        self.rawValue = rating
    }
}

public struct RatingView: View {
    @ObservedObject public  var rating: RatingModel

    
    public var maximumRating = 5
    // in case you neeed to change gary stars tp new image
    public var offImage: Image?
    public var onImage = Image(systemName: "star.fill").resizable()
   
    public var offColor = Color.gray
    public var onColor = Color.orange
    
    
    public  var body: some View {
        HStack(spacing:1) {
            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > rating.rawValue ? self.offColor : self.onColor).frame(width: 15, height: 15, alignment: .leading)
                   /* .onTapGesture {
                        self.rating.rawValue = number
                    }*/
            }
        }
        
        

        
    }
    
    private func image(for number: Int) -> Image {
        if number > rating.rawValue {
            // assign iameg that you need to
            return offImage?.resizable() ?? onImage
        } else {
            return onImage
        }
    }
}










public struct RatingView_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            // RatingView(rating: .constant(3))
            
        }
    }
}


