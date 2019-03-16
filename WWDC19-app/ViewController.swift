//
//  ViewController.swift
//  WWDC19-app
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var info: FlightInformationCell!
    var info2: FlightInformationCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        info = FlightInformationCell()
        
        info.bottomGlyph.image = Images.airplaneGlyph
        info.topLabel.text = "From"
        info.textField.text = "GIG"
        info.textField.placeholder = "Airport"
        info.textField.delegate = self
        info.bottomLabel.text = "12+ years"
        view.addSubview(info)
        
        info2 = FlightInformationCell()
        
        info2.topGlyph.image = Images.calendarGlyph
        info2.topLabel.text = "Departure"
        info2.textField.text = "2 JUN"
        info2.textField.placeholder = "Date"
        info2.textField.delegate = self
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

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    
    public
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === self.info.textField {
            guard
                (textField.text?.count ?? 0 + string.count < 3)
                    || string.count <= 0
                else { return false }
            self.info.textField.text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string.uppercased())
            return false
        }
        return true
    }
    
    public
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
