//
//  ViewController.swift
//  WWDC19-app
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        let info = FlightInformationCell()
        
//        info.topGlyph.image = Images.calendarGlyph
        info.bottomGlyph.image = Images.airplaneGlyph
        info.topLabel.text = "From"
        info.textField.text = "GIG"
        info.bottomLabel.text = "12+ years"
        view.addSubview(info)
        
        let info2 = FlightInformationCell()
        
        info2.topGlyph.image = Images.calendarGlyph
//        info2.bottomGlyph.image = Images.airplaneGlyph
        info2.topLabel.text = "Departure"
        info2.textField.text = "2 JUN"
        info2.bottomLabel.text = "Sunday 2018"
        info2.stepper.isHidden = true
        info2.focus = .topLabel
        view.addSubview(info)
        view.addSubview(info2)
        
        NSLayoutConstraint.activate([
            info.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            info.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            info2.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5),
            info2.leadingAnchor.constraint(equalTo: info.leadingAnchor)
            ])
    }


}

