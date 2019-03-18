//
//  ExclusiveButtonGroup.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class ExclusiveButtonGroup: UIControl {
    
    // MARK: - Properties -
    
    public
    var buttons: [UIButton] = []
    
    private lazy
    var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: buttons)
        
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    public var selectedIndex: Int = 0
    
    public
    var contentInsets: NSDirectionalEdgeInsets = .zero {
        didSet {
            updateMainConstraints()
        }
    }
    
    private
    var mainConstraints = [NSLayoutConstraint]()
    
    
    // MARK: - Initialization -
    
    public
    init(titles: [String]) {
        super.init(frame: CGRect(x: 0, y: 0, width: 343, height: 48))
        
        setUp(with: titles)
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Methods -
    
    // MARK: Set Up
    
    private
    func setUp(with titles: [String]) {
        backgroundColor = .clear
        clipsToBounds = true
        
        buttons = titles.map(createButton(with:))
        buttons.first?.isSelected = true
        buttons.first?.backgroundColor = Colors.purple
        
        translatesAutoresizingMaskIntoConstraints = false
        
        setUpViewHierarchy()
        setUpConstraints()
    }
    
    private
    func setUpViewHierarchy() {
        addSubview(stackView)
    }
    
    private
    func setUpConstraints() {
        // Size constraints
        updateMainConstraints()
        
        // Buttons constraints
        stackView.arrangedSubviews.forEach({ view in
            view.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
                .identifiedBy("buttonHeightAnchor = safeAreaLayoutGuide.heightAnchor")
                .isActive = true
        })
    }
    
    private
    func updateMainConstraints() {
        NSLayoutConstraint.deactivate(mainConstraints)
        mainConstraints.removeAll(keepingCapacity: true)
        mainConstraints = [
            stackView.topAnchor.constraint(
                equalTo: topAnchor, constant: contentInsets.top
                ).identifiedBy("stackView.topAnchor = safeAreaLayoutGuide.topAnchor"),
            stackView.leadingAnchor.constraint(
                equalTo: leadingAnchor, constant: contentInsets.leading
                ).identifiedBy("stackView.leadingAnchor = safeAreaLayoutGuide.leadingAnchor"),
            stackView.trailingAnchor.constraint(
                equalTo: trailingAnchor, constant: -contentInsets.trailing
                ).identifiedBy("stackView.trailingAnchor = safeAreaLayoutGuide.trailingAnchor"),
            stackView.bottomAnchor.constraint(
                equalTo: bottomAnchor, constant: -contentInsets.bottom
                ).identifiedBy("stackView.bottomAnchor = safeAreaLayoutGuide.bottomAnchor")
        ]
        
        guard subviews.contains(stackView) else { return }
        
        NSLayoutConstraint.activate(mainConstraints)
    }
    
    public override
    func updateConstraints() {
        updateMainConstraints()

        super.updateConstraints()
    }
    
    private
    func createButton(with title: String) -> UIButton {
        let button = RoundedButton()
        
        button.setTitle(title, for: [])
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        button.backgroundColor = Colors.lightGray
        button.setTitleColor(Colors.darkGray, for: .normal)
        button.setTitleColor(Colors.white, for: .selected)
        button.setTitleColor(Colors.lightGray, for: .highlighted)
        button.addTarget(self, action: #selector(buttonTapped(sender:)),
                         for: [.touchUpInside])
        button.addTarget(self, action: #selector(buttonReleased(sender:)),
                         for: [.touchDragExit, .touchCancel])
        button.addTarget(self, action: #selector(buttonHighlight(sender:)),
                         for: [.touchDown, .touchDragEnter])
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    public override
    func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    public
    func setButton(_ button: UIButton, apearenceForState state: State) {
        
        switch state {
        case .selected:
            button.backgroundColor = Colors.purple
            button.isSelected = true
        case .highlighted:
            button.backgroundColor = button.backgroundColor?.withAlphaComponent(0.4)
        default:
            button.backgroundColor = Colors.lightGray
            button.isSelected = false
        }
        
    }
    
    // MARK: Actions
    
    @objc private
    func buttonTapped(sender: UIButton) {
        
        for case let button in buttons where button !== sender {
            setButton(button, apearenceForState: .normal)
        }
        
        setButton(sender, apearenceForState: .selected)
        
        selectedIndex = buttons.firstIndex(of: sender)!
        sendActions(for: .valueChanged)
    }
    
    @objc private
    func buttonHighlight(sender: UIButton) {
        setButton(sender, apearenceForState: .highlighted)
    }
    
    @objc private
    func buttonReleased(sender: UIButton) {
        setButton(sender, apearenceForState: sender.isSelected ? .selected : .normal)
    }
}
