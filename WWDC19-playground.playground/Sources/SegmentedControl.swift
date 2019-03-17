//
//  SegmentedControl.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class SegmentedControl: UIControl {
    
    
    // MARK: - Properties -
    
    public
    var segments: [UIButton] = []
    
    private
    var selectionIndicator: UIView = {
        let view = UIView()
        
        return view
    }()
    
    
    // MARK: - Initialization -
    
    public convenience
    init() {
        self.init(items: [])
    }
    
    public
    init(items: [UIButton]) {
        super.init(frame: CGRect(x: 0, y: 0, width: 343, height: 48))
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init(items: [])
    }
    
    
    // MARK: - Methods -
    
    private
    func setUp() {
        backgroundColor = .white
    }
    
    public override
    func layoutSubviews() {
        layer.cornerRadius = frame.height / 2
        
        super.layoutSubviews()
    }
    
}


