//
//  Stepper.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class Stepper: UIView {
    
    // MARK: - Properties -
    
    public lazy
    var topButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 6))
        
        button.tintColor = Colors.gray
        button.setImage(Images.arrowUp, for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.contentVerticalAlignment = .top
        
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public lazy
    var bottomButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 6))
        
        button.tintColor = Colors.blue
        button.setImage(Images.arrowDown, for: [])
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        button.contentVerticalAlignment = .bottom
        
        button.addTarget(self, action: #selector(decrementCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        
        return button
    }()
    
    public
    var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 11, height: 20))
        
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = Colors.blue
        label.textAlignment = .center
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Initialization -
    
    public
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 12, height: 53))
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    // MARK: - Methods -
    
    @objc private
    func incrementCount() {
        guard
            let text = label.text,
            let value = Int(text)
            else { return }
        label.text = String(min(value + 1, 9))
        
        if label.text == "9" { topButton.isEnabled = false }
        else { topButton.isEnabled = true }
        
        bottomButton.isEnabled = true
    }
    
    @objc private
    func decrementCount() {
        guard
            let text = label.text,
            let value = Int(text)
            else { return }
        label.text = String(max(value - 1, 0))
        
        if label.text == "0" { bottomButton.isEnabled = false }
        else { bottomButton.isEnabled = true }
        
        topButton.isEnabled = true
    }
    
    private
    func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setUpViewHierarchy()
        setUpConstraints()
    }
    
    private
    func setUpViewHierarchy() {
        addSubview(label)
        insertSubview(topButton, at: 0)
        insertSubview(bottomButton, at: 0)
    }
    
    private
    func setUpConstraints() {
        
        // Stepper size constraints
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50)
                .identifiedBy("Stepper-width"),
            heightAnchor.constraint(equalToConstant: 93)
                .identifiedBy("Stepper-height")
            ])
        
        // Top button size constraints
        NSLayoutConstraint.activate([
            topButton.widthAnchor.constraint(equalTo: topButton.heightAnchor)
                .identifiedBy("topButton.widthAnchor = topButton.heightAnchor")
            ])
        
        
        // Bottom button size constraints
        NSLayoutConstraint.activate([
            bottomButton.widthAnchor.constraint(equalTo: bottomButton.heightAnchor)
                .identifiedBy("bottomButton.widthAnchor = bottomButton.heightAnchor")
            ])
        
        // Vertical constraints
        NSLayoutConstraint.activate([
            topButton.topAnchor.constraint(equalTo: topAnchor)
                .identifiedBy("topButton.topAnchor = Stepper.topAnchor"),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
                .identifiedBy("label.centerYAnchor = centerYAnchor"),
            bottomButton.bottomAnchor.constraint(equalTo: bottomAnchor)
                .identifiedBy("bottomButton.topAnchor = Stepper.bottomAnchor")
            ])
        
        // Horizontal constraints
        NSLayoutConstraint.activate([
            
            // Equal widths
            topButton.widthAnchor.constraint(equalTo: widthAnchor)
                .identifiedBy("topButton.widthAnchor = Stepper.widthAnchor"),
            label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5)
                .identifiedBy("label.widthAnchor = Stepper.widthAnchor / 2"),
            bottomButton.widthAnchor.constraint(equalTo: widthAnchor)
                .identifiedBy("bottomButton.widthAnchor = widthAnchor"),
            
            // Centered
            topButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("topButton.centerXAnchor = centerXAnchor"),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("label.centerXAnchor = centerXAnchor"),
            bottomButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("bottomButton.centerXAnchor = centerXAnchor")
            ])
    }
}
