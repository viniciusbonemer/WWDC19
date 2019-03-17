//
//  UIStackView.swift
//  Alert
//
//  Created by Vinícius Bonemer on 25/02/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

extension UIStackView {
    
    /// The characteristics of a separator to be used between the arranged subviews
    struct Separator {
        var width: CGFloat
        var color: UIColor
    }
    
    /**
     Adds arranged subviews with separators in between
     
     Use this method to add arrenged subviews with a common separator. When \
     using separators, you should not use a distribution of `fillEqually`. Using \
     it does not cause an error, but produces unintended results because the \
     separators may be streched to match the size of the arrenged subviews.
     
     - Parameter subviewsToAdd: The views to be added to the array of views \
     arranged by the stack.
     - Parameter separator: The separator to be used in between the arrenged \
     subviews.
     - Parameter uniformly: Determines whether the arrenged subviews are set to \
     have the same size. Defaults tp false. 
     */
    func addArrangedSubviews(_ subviewsToAdd: [UIView], withSeparator separator: Separator, uniformly: Bool = false) {
        
        for (index, view) in subviewsToAdd.enumerated() {
            
            if index != 0 {
                
                let separatorView = UIView(frame: .zero)
                separatorView.translatesAutoresizingMaskIntoConstraints = false
                separatorView.backgroundColor = separator.color
                addArrangedSubview(separatorView)
                
                switch self.axis {
                case .horizontal:
                    NSLayoutConstraint.activate([
                        separatorView.widthAnchor.constraint(equalToConstant: separator.width),
                        separatorView.heightAnchor.constraint(equalTo: self.heightAnchor
                        )])
                    
                case .vertical:
                    NSLayoutConstraint.activate([
                        separatorView.heightAnchor.constraint(equalToConstant: separator.width),
                        separatorView.widthAnchor.constraint(equalTo: self.widthAnchor)
                        ])
                }
                
            }
            
            addArrangedSubview(view)
            
            guard uniformly else { continue }
            guard let firstView = self.arrangedSubviews.first else { continue }
            
            switch self.axis {
            case .horizontal:
                view.widthAnchor.constraint(equalTo: firstView.widthAnchor).isActive = true
            case .vertical:
                view.heightAnchor.constraint(equalTo: firstView.heightAnchor).isActive = true
            }
            
        }
    }
    
    /**
     Adds an array of views to the end of the arrangedSubviews array.
     
     Use this method to add multiple arrenged subviews at once. This method \
     calls `addArrangedSubview(_:)` on each subview on the array. 
     
     - Parameter subviewsToAdd: The views to be added to the array of views \
     arranged by the stack.
     */
    func addArrangedSubviews(_ subviewsToAdd: [UIView]) {
        
        subviewsToAdd.forEach { addArrangedSubview($0) }
    }
    
}
