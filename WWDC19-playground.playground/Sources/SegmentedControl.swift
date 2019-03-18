//
//  SegmentedControl.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class SegmentedControl: ExclusiveButtonGroup {
    
    private
    var selectionMarker: UIView = {
        let view = UIView()
        
        view.backgroundColor = Colors.purple
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private
    var selectionMarkerConstraints = [NSLayoutConstraint]()
    
    public override
    init(titles: [String]) {
        super.init(titles: titles)
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override
    func setButton(_ button: UIButton, apearenceForState state: UIControl.State) {
        guard case .selected = state else {
            button.isSelected = false
            return
        }
        
        button.isSelected = true
        
        // TODO: Animate selection Marker
        let index = buttons.firstIndex(of: button)!
        NSLayoutConstraint.deactivate(selectionMarkerConstraints)
        selectionMarkerConstraints[index].isActive = true
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: .beginFromCurrentState, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
    }
    
    private
    func setUp() {
        backgroundColor = .white
        buttons.forEach { $0.backgroundColor = .clear }
        contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 3, bottom: 0, trailing: 3
        )
        
        setUpViewHierarchy()
        setUpConstraints() 
    }
    
    private
    func setUpViewHierarchy() {
        guard !subviews.isEmpty else {
            addSubview(selectionMarker)
            return
        }
        insertSubview(selectionMarker, belowSubview: subviews.first!)
    }
    
    private
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            selectionMarker.heightAnchor.constraint(equalTo: heightAnchor, constant: -6),
            selectionMarker.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.0 / CGFloat(buttons.count), constant: -6),
            selectionMarker.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        selectionMarkerConstraints = buttons.map {
            selectionMarker.centerXAnchor.constraint(equalTo: $0.centerXAnchor)
        }
        
        selectionMarkerConstraints.first?.isActive = true
        
    }
    
    public override
    func layoutSubviews() {
        super.layoutSubviews()
        
        selectionMarker.layer.cornerRadius = selectionMarker.frame.height / 2
    }
    
}


