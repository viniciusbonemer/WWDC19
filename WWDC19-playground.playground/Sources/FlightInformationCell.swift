//
//  FlightInformationCell.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 15/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class FlightInformationCell: UIView {
    
    // MARK: - Properties -
    
    // MARK: Views
    public
    var topLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = Colors.darkGray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public lazy
    var textField: UITextField = {
        let textField = UITextField()
        
        textField.textColor = Colors.blue
        textField.autocapitalizationType = .allCharacters
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    public
    var bottomLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18)
        label.textColor = Colors.lightGray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public
    var topGlyph: Glyph = {
        let glyph = Glyph()
        
        glyph.translatesAutoresizingMaskIntoConstraints = false
        
        return glyph
    }()
    
    public
    var bottomGlyph: Glyph = {
        let glyph = Glyph()
        
        glyph.translatesAutoresizingMaskIntoConstraints = false
        
        return glyph
    }()
    
    public
    var stepper = Stepper()
    
    // MARK: Other
    
    public
    var focus: FlightInformationCell.Focus = .middleLabel {
        didSet {
            setUpFonts(for: focus)
        }
    }
    
    private
    var constraintsWithBottomGlyph: [NSLayoutConstraint] = []
    
    private
    var constraintsWithoutBottomGlyph: [NSLayoutConstraint] = []
    
    // MARK: - Initialization -
    
    public
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 170, height: 116))
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    // MARK: - Methods -
    
    private
    func setUp() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        setUpViewHierarchy()
        setUpConstraints()
        setUpFonts(for: .middleLabel)
    }
    
    private
    func setUpViewHierarchy() {
        addSubview(topLabel)
        addSubview(textField)
        addSubview(bottomLabel)
        
        addSubview(topGlyph)
        addSubview(bottomGlyph)
        
        addSubview(stepper)
    }
    
    public
    func setUpFonts(for focus: FlightInformationCell.Focus) {
        switch focus {
        case .topLabel:
            topLabel.font = .systemFont(ofSize: 20, weight: .medium)
            textField.font = .systemFont(ofSize: 28, weight: .semibold)
        case .middleLabel:
            topLabel.font = .systemFont(ofSize: 20, weight: .regular)
            textField.font = .systemFont(ofSize: 28, weight: .bold)
        }
    }
    
    public override
    func updateConstraints() {
        
        if let _ = bottomGlyph.image {
            NSLayoutConstraint.deactivate(constraintsWithoutBottomGlyph)
            NSLayoutConstraint.activate(constraintsWithBottomGlyph)
        } else {
            NSLayoutConstraint.deactivate(constraintsWithBottomGlyph)
            NSLayoutConstraint.activate(constraintsWithoutBottomGlyph)
        }
        
        super.updateConstraints()
    }
    
    private
    func setUpConstraints() {
        
        // Cell size constraints
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 170)
                .identifiedBy("Cell-width"),
            heightAnchor.constraint(equalToConstant: 116)
                .identifiedBy("Cell-height")
            ])
        
        // Top label size constraints
        NSLayoutConstraint.activate([
            topLabel.heightAnchor.constraint(equalToConstant: 29)
                .identifiedBy("topLabel.heightAnchor")
            ])
        
        // Middle label size constraints
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 41)
                .identifiedBy("textField.heightAnchor")
            ])
        
        // Bottom label size constraints
        NSLayoutConstraint.activate([
            bottomLabel.heightAnchor.constraint(equalToConstant: 23)
                .identifiedBy("bottomLabel.heightAnchor")
            ])
        
        // Top glyph size constraints
        NSLayoutConstraint.activate([
            topGlyph.widthAnchor.constraint(equalToConstant: 26)
                .identifiedBy("topGlyph.widthAnchor"),
            topGlyph.heightAnchor.constraint(equalTo: topGlyph.widthAnchor)
                .identifiedBy("topGlyph.heightAnchor = topGlyph.widthAnchor")
            ])
        
        // Bottom glyph size constraints
        NSLayoutConstraint.activate([
            bottomGlyph.widthAnchor.constraint(equalToConstant: 20)
                .identifiedBy("bottomGlyph.widthAnchor"),
            bottomGlyph.heightAnchor.constraint(equalTo: bottomGlyph.widthAnchor)
                .identifiedBy("bottomGlyph.heightAnchor = bottomGlyph.widthAnchor")
            ])
        
        // Stepper size constraints is set by default in the Stepper class
        
        // Top label position
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8)
                .identifiedBy("topLabel.topAnchor = topAnchor + 8"),
            topLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
                .identifiedBy("topLabel.leadingAnchor + leadingAnchor + 8"),
            ])
        
        // Middle label position
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5)
                .identifiedBy("textField.topAnchor = topLabel.bottomAnchor + 5"),
            textField.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor)
                .identifiedBy("textField.leadingAnchor = topLabel.leadingAnchor"),
            textField.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor)
                .identifiedBy("textField.trailingAnchor = topLabel.trailingAnchor")
            ])
        
        // Bottom label position
        constraintsWithBottomGlyph = [
            bottomLabel.leadingAnchor.constraint(equalTo: bottomGlyph.trailingAnchor, constant: 4)
                .identifiedBy("bottomLabel.leadingAnchor = bottomGlyph.trailingAnchor + 4")
        ]
        
        constraintsWithoutBottomGlyph = [
            bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor)
                .identifiedBy("bottomLabel.leadingAnchor = topLabel.leadingAnchor")
        ]
        
        NSLayoutConstraint.activate(constraintsWithBottomGlyph)
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: textField.bottomAnchor)
                .identifiedBy("bottomLabel.topAnchor = textField.bottomAnchor"),
            bottomLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -4)
                .identifiedBy("bottomLabel.trailingAnchor <= trailingAnchor - 4"),
            bottomLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
                .identifiedBy("bottomLabel.bottomAnchor <= bottomAnchor - 8")
            ])
        
        // Top glyph position
        NSLayoutConstraint.activate([
            topGlyph.leadingAnchor.constraint(greaterThanOrEqualTo: topLabel.trailingAnchor, constant: 6)
                .identifiedBy("topGlyph.leadingAnchor >= topLabel.trailingAnchor + 6"),
            topGlyph.topAnchor.constraint(equalTo: topLabel.topAnchor)
                .identifiedBy("topGlyph.topAnchor = topLabel.topAnchor"),
            topGlyph.trailingAnchor.constraint(equalTo: stepper.trailingAnchor)
            ])
        
        // Bottom glyph position
        NSLayoutConstraint.activate([
            bottomGlyph.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 2)
                .identifiedBy("bottomGlyph.topAnchor = textField.bottomAnchor + 2"),
            bottomGlyph.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor, constant: 0)
                .identifiedBy("bottomGlyph.leadingAnchor = topLabel.leadingAnchor")
            ])
        
        // Stepper position
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: topLabel.topAnchor, constant: 0)
                .identifiedBy("stepper.topAnchor = topLabel.topAnchor"),
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14)
                .identifiedBy("stepper.trailingAnchor = trailingAnchor - 8"),
            stepper.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
                .identifiedBy("bottomAnchor.constraint <= bottomAnchor - 8")
            ])
    }
    
}

// MARK: - FlightInformationCell.Focus

extension FlightInformationCell {
    public
    enum Focus {
        case topLabel
        case middleLabel
    }
}
