//
//  ViewController.swift
//  WWDC19-app
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    public
//    var fromCell: FlightInformationCell = {
//        let cell = FlightInformationCell()
//
//        cell.topLabel.text = "From"
//        cell.textField.text = "GIG"
//        cell.bottomLabel.text = "Rio de Janeiro"
//
//        cell.topGlyph.image = nil
//        cell.bottomGlyph.image = Images.airplaneGlyph
//
//        cell.stepper.isHidden = true
//
//        return cell
//    }()
//
//    public
//    var toCell: FlightInformationCell = {
//        let cell = FlightInformationCell()
//
//        cell.topLabel.text = "To"
//        cell.textField.text = "SFO"
//        cell.bottomLabel.text = "San Francisco"
//
//        cell.topGlyph.isHidden = true
//        cell.bottomGlyph.image = Images.locationGlyph
//        cell.stepper.isHidden = true
//
//        return cell
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let stack = UIStackView(arrangedSubviews: [fromCell, toCell])
//
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.alignment = .fill
//
//        view.addSubview(stack)
//
////        view.addSubview(fromCell)
//
////        NSLayoutConstraint.activate([
////            fromCell.centerXAnchor.constraint(equalTo: view.centerXAnchor),
////            fromCell.centerYAnchor.constraint(equalTo: view.centerYAnchor),
////            fromCell.heightAnchor.constraint(equalToConstant: 116),
////            fromCell.widthAnchor.constraint(equalToConstant: 170)
////            ])
//
//        NSLayoutConstraint.activate([
//            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stack.heightAnchor.constraint(equalToConstant: 122),
//            stack.widthAnchor.constraint(equalToConstant: 343)
//            ])
//
////        fromCell.sizeToFit()
//
////        stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
////        stack.widthAnchor.constraint(equalToConstant: 350).isActive = true
//
//    }

    
//    var info: FlightInformationCell!
//    var info2: FlightInformationCell!
//    lazy var buttonGroup: ExclusiveButtonGroup = ExclusiveButtonGroup(titles: "First", "Second", "Third")

    lazy var card = FlightInformationCard()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(card)
        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            card.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            card.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
            ])
        
        
        view.backgroundColor = Colors.white
        
    }
}

//        view.addSubview(buttonGroup)
//
//        NSLayoutConstraint.activate([
//            buttonGroup.widthAnchor.constraint(equalToConstant: 303),
//            buttonGroup.heightAnchor.constraint(equalToConstant: 42),
//            buttonGroup.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            buttonGroup.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 561)
//            ])
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .lightGray
//
//        info = FlightInformationCell()
//
//        info.bottomGlyph.image = Images.airplaneGlyph
//        info.topLabel.text = "From"
//        info.textField.text = "GIG"
//        info.textField.placeholder = "Airport"
//        info.textField.delegate = self
//        info.bottomLabel.text = "12+ years"
//        view.addSubview(info)
//
//        info2 = FlightInformationCell()
//
//        info2.topGlyph.image = Images.calendarGlyph
//        info2.topLabel.text = "Departure"
//        info2.textField.text = "2 JUN"
//        info2.textField.placeholder = "Date"
//        info2.textField.delegate = self
//        info2.bottomLabel.text = "Sunday 2018"
//        info2.stepper.isHidden = true
//        info2.focus = .topLabel
//        view.addSubview(info)
//        view.addSubview(info2)
//
//        NSLayoutConstraint.activate([
//            info.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
//            info.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//            info2.topAnchor.constraint(equalTo: info.bottomAnchor, constant: 5),
//            info2.leadingAnchor.constraint(equalTo: info.leadingAnchor)
//            ])
//    }
//
//
//}

// MARK: - UITextFieldDelegate

//extension ViewController: UITextFieldDelegate {
//
//    public
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField === self.info.textField {
//            guard
//                (textField.text?.count ?? 0 + string.count < 3)
//                    || string.count <= 0
//                else { return false }
//            self.info.textField.text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string.uppercased())
//            return false
//        }
//        return true
//    }
//
//    public
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//
//}
