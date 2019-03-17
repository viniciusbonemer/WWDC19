//
//  ExclusiveButtonGroup.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 16/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class ExclusiveButtonGroup: UIView {
    
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
    
    
    // MARK: - Initialization -
    
    public
    init(titles: String...) {
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
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor)
                .identifiedBy("stackView.topAnchor = safeAreaLayoutGuide.topAnchor"),
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
                .identifiedBy("stackView.leadingAnchor = safeAreaLayoutGuide.leadingAnchor"),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
                .identifiedBy("stackView.trailingAnchor = safeAreaLayoutGuide.trailingAnchor"),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
                .identifiedBy("stackView.bottomAnchor = safeAreaLayoutGuide.bottomAnchor")
            ])
        
        // Buttons constraints
        stackView.arrangedSubviews.forEach({ view in
            view.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor)
                .identifiedBy("buttonHeightAnchor = safeAreaLayoutGuide.heightAnchor")
                .isActive = true
        })
        
    }
    
    private
    func createButton(with title: String) -> UIButton {
        let button = RoundedButton()
        
        button.setTitle(title, for: [])
        button.titleLabel?.font = .systemFont(ofSize: 13, weight: .regular)
        
        button.backgroundColor = Colors.lightGray
        button.setTitleColor(Colors.darkGray, for: .normal)
        button.setTitleColor(Colors.white, for: .selected)
        
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
    
    public override
    func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
    }
    
    // MARK: Actions
    
    @objc private
    func buttonTapped(sender: UIButton) {
        
        for case let button in buttons where button !== sender {
            button.backgroundColor = Colors.lightGray
            button.isSelected = false
        }
        
        sender.backgroundColor = Colors.purple
        sender.isSelected = true
    }
}
