//
//  NSLayoutConstraint.swift
//  ConstraintExtension
//
//  Created by Vinícius Bonemer on 08/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import class UIKit.NSLayoutConstraint
import struct UIKit.UILayoutPriority

extension NSLayoutConstraint {
    
    func identifiedBy(_ identifier: String?) -> NSLayoutConstraint {
        self.identifier = identifier
        return self
    }
    
    func withPriority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
    
}
