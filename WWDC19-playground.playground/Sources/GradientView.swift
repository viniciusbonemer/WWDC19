//
//  GradientView.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 17/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class GradientView: UIView {
    
    typealias `Type` = CAGradientLayerType
    
    var type: GradientView.`Type` {
        get {
            return gradientLayer.type
        }
        set {
            gradientLayer.type = newValue
        }
    }
    
    var colors: [Any]? {
        get {
            return gradientLayer.colors
        }
        set {
            gradientLayer.colors = newValue
        }
    }
    
    var startPoint: CGPoint {
        get {
            return gradientLayer.startPoint
        }
        set {
            gradientLayer.startPoint = newValue
        }
    }
    
    var endPoint: CGPoint {
        get {
            return gradientLayer.endPoint
        }
        set {
            gradientLayer.endPoint = newValue
        }
    }
    
    private
    var colorChangeAnimationKey: String = "colorChange"
    
    private
    var endPointChangeAnimationKey: String = "endPointChange"
    
    private lazy
    var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer(layer: self.layer)
        
        layer.type = CAGradientLayerType.axial
        layer.colors = [Colors.pink.cgColor, Colors.purple.cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 0.3125)
        
        return layer
    }()
    
    public
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 375, height: 768))
        
        setUp()
    }
    
    public required
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private
    func setUp() {
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    public override
    func layoutSubviews() {
        gradientLayer.frame = bounds
        
        super.layoutSubviews()
    }
    
    public
    func startAnimation() {
        gradientLayer.removeAnimation(forKey: colorChangeAnimationKey)
        
        guard let colors = colors, !colors.isEmpty else { return }
        
        let gradientChangeColor = CABasicAnimation(keyPath: "colors")
        gradientChangeColor.duration = 6.0
        gradientChangeColor.fromValue = colors
        gradientChangeColor.toValue = Array(repeating: colors.last!, count: colors.count)
        gradientChangeColor.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
        gradientChangeColor.isRemovedOnCompletion = false
        gradientChangeColor.autoreverses = true
        gradientChangeColor.repeatCount = .infinity
        gradientChangeColor.fillMode = CAMediaTimingFillMode.forwards
        gradientLayer.add(gradientChangeColor, forKey: colorChangeAnimationKey)
    }
    
}
