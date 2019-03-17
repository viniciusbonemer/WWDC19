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
        
        label.font = .systemFont(ofSize: 15)
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
            topLabel.font = .systemFont(ofSize: 17, weight: .medium)
            textField.font = .systemFont(ofSize: 20, weight: .semibold)
        case .middleLabel:
            topLabel.font = .systemFont(ofSize: 17, weight: .regular)
            textField.font = .systemFont(ofSize: 20, weight: .bold)
        }
    }
    
    public
    func applyColors() {
        textField.textColor = textField.isUserInteractionEnabled ? Colors.blue : Colors.black
    }
    
    public override func layoutSubviews() {
        applyColors()
        
        super.layoutSubviews()
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
        
        // Stepper size constraints is set by default in the Stepper class
        
        topLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Top label position
        NSLayoutConstraint.activate([
            topLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 8)
                .identifiedBy("topLabel.topAnchor = topAnchor + 8"),
            topLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor)
                .identifiedBy("topLabel.leadingAnchor = textField.leadingAnchor"),
            topLabel.heightAnchor.constraint(equalToConstant: 20)
                .identifiedBy("topLabel.heightAnchor = 20"),
            topLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -46)
                .identifiedBy("topLabel.trailingAnchor = trailingAnchor - 46"),
            ])
        
        textField.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        // Text field position
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 4)
                .identifiedBy("textField.topAnchor = topLabel.bottomAnchor + 4"),
            textField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 2)
                .identifiedBy("textField.centerYAnchor = centerYAnchor + 2"),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
                .identifiedBy("textField.leadingAnchor = leadingAnchor + 8"),
            textField.heightAnchor.constraint(equalToConstant: 30)
                .identifiedBy("textField.heightAnchor = 30"),
            textField.trailingAnchor.constraint(equalTo: topLabel.trailingAnchor)
                .identifiedBy("textField.trailingAnchor = topLabel.trailingAnchor")
            ])
        
        // Bottom label position
        constraintsWithBottomGlyph = [
            bottomLabel.leadingAnchor.constraint(equalTo: bottomGlyph.trailingAnchor, constant: 4)
                .identifiedBy("bottomLabel.leadingAnchor = bottomGlyph.trailingAnchor + 4"),
        ]
        
        constraintsWithoutBottomGlyph = [
            bottomLabel.leadingAnchor.constraint(equalTo: topLabel.leadingAnchor)
                .identifiedBy("bottomLabel.leadingAnchor = topLabel.leadingAnchor")
        ]
        
        NSLayoutConstraint.activate(constraintsWithBottomGlyph)
        
        bottomLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        bottomLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: textField.bottomAnchor)
                .identifiedBy("bottomLabel.topAnchor = textField.bottomAnchor"),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
                .identifiedBy("bottomLabel.trailingAnchor = trailingAnchor - 4"),
            bottomLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8)
                .identifiedBy("bottomLabel.bottomAnchor <= bottomAnchor - 8"),
            bottomLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100)
                .identifiedBy("bottomLabel.widthAnchor >= 100")
            ])
        
        // Top glyph size constraints
        NSLayoutConstraint.activate([
            topGlyph.leadingAnchor.constraint(equalTo: topLabel.trailingAnchor, constant: 6)
                .identifiedBy("topGlyph.leadingAnchor = topLabel.trailingAnchor + 6"),
            topGlyph.topAnchor.constraint(equalTo: topLabel.topAnchor)
                .identifiedBy("topGlyph.topAnchor = topLabel.topAnchor"),
            topGlyph.widthAnchor.constraint(equalToConstant: 26)
                .identifiedBy("topGlyph.widthAnchor = 26"),
            topGlyph.heightAnchor.constraint(equalTo: topGlyph.widthAnchor)
                .identifiedBy("topGlyph.heightAnchor = topGlyph.widthAnchor")
            ])
        
        // Bottom glyph position
        NSLayoutConstraint.activate([
            bottomGlyph.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 3)
                .identifiedBy("bottomGlyph.topAnchor = textField.bottomAnchor + 3"),
            bottomGlyph.leadingAnchor.constraint(equalTo: textField.leadingAnchor)
                .identifiedBy("bottomGlyph.leadingAnchor = textField.leadingAnchor"),
            bottomGlyph.widthAnchor.constraint(equalToConstant: 20)
                .identifiedBy("bottomGlyph.widthAnchor = 20"),
            bottomGlyph.heightAnchor.constraint(equalTo: bottomGlyph.widthAnchor)
                .identifiedBy("bottomGlyph.heightAnchor = bottomGlyph.widthAnchor"),
            bottomGlyph.bottomAnchor.constraint(equalTo: bottomLabel.bottomAnchor, constant: -4)
                .identifiedBy("bottomGlyph.bottomAnchor = bottomLabel.bottomAnchor - 4")
            ])
        
        // Stepper position
        NSLayoutConstraint.activate([
            stepper.topAnchor.constraint(equalTo: topLabel.topAnchor)
                .identifiedBy("stepper.topAnchor = topLabel.topAnchor"),
            stepper.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
                .identifiedBy("stepper.trailingAnchor = trailingAnchor - 4"),
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
