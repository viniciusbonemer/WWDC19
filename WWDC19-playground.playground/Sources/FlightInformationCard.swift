//
//  FlightInformationCell.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class FlightInformationCard: UIView {
    
    // MARK: - Properties -
    
    // MARK: UI Elements
    
    public lazy
    var fromCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = "From"
        cell.textField.text = ""
        cell.textField.placeholder = "Airport"
        cell.textField.delegate = self
        cell.bottomLabel.text = ""
        
        cell.topGlyph.isHidden = true
        cell.bottomGlyph.image = Images.airplaneGlyph
        cell.stepper.isHidden = true
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public lazy
    var toCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = "To"
        cell.textField.text = ""
        cell.textField.placeholder = "Airport"
        cell.textField.delegate = self
        cell.bottomLabel.text = ""
        
        cell.topGlyph.isHidden = true
        cell.bottomGlyph.image = Images.locationGlyph
        cell.stepper.isHidden = true
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public
    var departureCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = "Departure"
        cell.textField.text = "2 JUN"
        cell.textField.isUserInteractionEnabled = false
        cell.bottomLabel.text = "Sunday 2019"
        
        cell.topGlyph.image = Images.calendarGlyph
        cell.bottomGlyph.isHidden = true
        cell.stepper.isHidden = true
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public
    var returnCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = "Return"
        cell.textField.text = "8 JUN"
        cell.textField.isUserInteractionEnabled = false
        cell.bottomLabel.text = "Saturday 2019"
        
        cell.topGlyph.image = Images.calendarGlyph
        cell.bottomGlyph.isHidden = true
        cell.stepper.isHidden = true
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public
    var adultsCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = "Passengers"
        cell.textField.text = "ADULTS"
        cell.textField.isUserInteractionEnabled = false
        cell.bottomLabel.text = "12+ years"
        
        cell.topGlyph.isHidden = true
        cell.bottomGlyph.isHidden = true
        cell.stepper.isHidden = false
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public
    var childrenCell: FlightInformationCell = {
        let cell = FlightInformationCell()
        
        cell.topLabel.text = ""
        cell.textField.text = "CHILDREN"
        cell.textField.isUserInteractionEnabled = false
        cell.bottomLabel.text = "1-12 years"
        
        cell.topGlyph.isHidden = true
        cell.bottomGlyph.isHidden = true
        cell.stepper.isHidden = false
        
        cell.translatesAutoresizingMaskIntoConstraints = false
        
        return cell
    }()
    
    public
    var seatTypeButtonGroup: ExclusiveButtonGroup = {
        let buttonGroup = ExclusiveButtonGroup(titles: "Economy", "Business", "First Class")
        
        buttonGroup.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonGroup
    }()
    
    public lazy
    var searchButton: UIButton = {
        let button = RoundedButton()
        
        button.setTitle("SEARCH FLIGHT", for: [])
        button.backgroundColor = Colors.purple
        button.setTitleColor(Colors.white, for: .normal)
        button.setTitleColor(Colors.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(buttonPressed(sender:)),
                         for: [.touchUpInside])
        button.addTarget(self, action: #selector(buttonReleased(sender:)),
                         for: [.touchDragExit, .touchCancel])
        button.addTarget(self, action: #selector(buttonHighlight(sender:)),
                         for: [.touchDown, .touchDragEnter])
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .regular)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: Stack Views
    
    private lazy
    var locationsStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [fromCell, toCell])
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 1
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy
    var datesStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [departureCell, returnCell])
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 1
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy
    var passengersStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [adultsCell, childrenCell])
        
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 1
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy
    var buttonsStack: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = UIStackView.Distribution.fillProportionally
        stack.alignment = .fill
        stack.spacing = 29
        
        stack.addArrangedSubviews(
            [seatTypeButtonGroup, searchButton],
            withSeparator: UIStackView.Separator(width: 1, color: Colors.lightGray))
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private lazy
    var stackView: UIStackView = {
        let stack = UIStackView()

        stack.axis = .vertical
        stack.distribution = UIStackView.Distribution.equalSpacing
        stack.alignment = UIStackView.Alignment.fill
        stack.spacing = 1
        
        stack.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubviews(
            [locationsStack, datesStack, passengersStack],
            withSeparator: UIStackView.Separator(width: 1, color: Colors.lightGray)
        )

        return stack
    }()
    
    
    // MARK: - Initialization -
    
    public
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 343, height: 579))
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    
    // MARK: - Methods -
    
    // MARK: Set Up
    
    private
    func setUp() {
        backgroundColor = Colors.white
        clipsToBounds = false
        layer.cornerRadius = 12
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.30
        layer.shadowOffset = CGSize(width: 0, height: 14)
        layer.shadowRadius = 18
        layer.masksToBounds = false
        
        setUpViewHierarchy()
        setUpConstraints()
    }
    
    private
    func setUpViewHierarchy() {
        addSubview(stackView)
        addSubview(buttonsStack)
    }
    
    private
    func setUpConstraints() {
        
        // Size Constraints
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 343),
            heightAnchor.constraint(equalToConstant: 600)
            ])
        
        // Stackview's arranged subviews' constraints
        NSLayoutConstraint.activate([
            locationsStack.heightAnchor.constraint(equalToConstant: 116)
                .withPriority(999),
            datesStack.heightAnchor.constraint(equalToConstant: 116)
                .withPriority(999),
            passengersStack.heightAnchor.constraint(equalToConstant: 116)
                .withPriority(999),
            seatTypeButtonGroup.heightAnchor.constraint(equalToConstant: 42)
                .withPriority(999),
            searchButton.heightAnchor.constraint(equalToConstant: 42)
                .withPriority(999)
            ])
        
        // StackView constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 5)
                .identifiedBy("stackView.topAnchor = topAnchor + 29"),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 13)
                .identifiedBy("stackView.leadingAnchor = leadingAnchor + 20"),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("stackView.centerXAnchor = centerXAnchor")
            ])
        
        // Buttons Stack Constraints
        NSLayoutConstraint.activate([
            buttonsStack.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 52),
            buttonsStack.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            buttonsStack.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            buttonsStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44)
            ])
        
    }
    
    // MARK: Actions
    
    @objc private
    func buttonPressed(sender: UIButton) {
        sender.backgroundColor = Colors.purple
    }
    
    @objc private
    func buttonHighlight(sender: UIButton) {
        sender.backgroundColor = Colors.pink
    }
    
    @objc private
    func buttonReleased(sender: UIButton) {
        sender.backgroundColor = Colors.purple
    }
    
}

// MARK: - UITextFieldDelegate

extension FlightInformationCard: UITextFieldDelegate {
    
    public
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField === fromCell.textField || textField === toCell.textField {
            guard
                (textField.text?.count ?? 0 + string.count < 3)
                    || string.count <= 0
                else { return false }
            textField.text = (textField.text as NSString?)?.replacingCharacters(in: range, with: string.uppercased())
            return false
        }
        return true
    }

    public
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    public
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        let city: String
        
        if textField.text == "GIG" {
            city = "Rio de Janeiro"
        } else if textField.text == "SFO" {
            city = "San Francisco"
        } else { return }
        
        if textField === fromCell.textField {
            fromCell.bottomLabel.text = city
        } else if textField === toCell.textField {
            toCell.bottomLabel.text = city
        }
    }
    
}
