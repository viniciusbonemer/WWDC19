//
//  Glyph.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class Glyph: UIImageView {
    
    public init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 14, height: 14))
        
        contentMode = .scaleAspectFit
        tintColor = Colors.darkGray
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
}
