//
//  SearchFlightsViewController.swift
//  WWDC19
//
//  Created by Vinícius Bonemer on 17/03/19.
//  Copyright © 2019 Vinícius Bonemer. All rights reserved.
//

import UIKit

public
class SearchFlightsViewController: UIViewController {
    
    // MARK: - Properties -
    
    private
    var gradientView: GradientView = {
        let view = GradientView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private
    var mapView: UIImageView = {
        let imageView = UIImageView(image: Images.map)
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private
    var cardView: FlightInformationCard = {
        let card = FlightInformationCard()
        
        card.translatesAutoresizingMaskIntoConstraints = false
        
        return card
    }()
    
    private
    var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.textColor = Colors.white
        label.textAlignment = .center
        label.text = "Search Flights"
        label.numberOfLines = 1
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    // MARK: - Methods -
    
    public override
    func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    private
    func setUp() {
        setUpViewHierarchy()
        setUpConstraints()
        
        view.backgroundColor = Colors.white
        gradientView.startAnimation()
    }
    
    private
    func setUpViewHierarchy() {
        view.addSubview(gradientView)
        view.addSubview(cardView)
        view.addSubview(mapView)
        view.addSubview(titleLabel)
    }
    
    private
    func setUpConstraints() {
        
        // Card View Constraints
        NSLayoutConstraint.activate([
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                .identifiedBy("cardView.centerXAnchor = view.centerXAnchor"),
            cardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 174)
                .identifiedBy("cardView.topAnchor = view.topAnchor + 174"),
//            cardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
//                .identifiedBy("cardView.bottomAnchor = view.bottomAnchor - 15")
            ])
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor)
                .identifiedBy("gradientView.topAnchor = view.topAnchor"),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
                .identifiedBy("gradientView.leadingAnchor = view.leadingAnchor"),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                .identifiedBy("gradientView.trailingAnchor = view.trailingAnchor"),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                .identifiedBy("gradientView.bottomAnchor = view.bottomAnchor")
            ])
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor, constant: 46),
            mapView.widthAnchor.constraint(equalToConstant: 374),
            mapView.heightAnchor.constraint(equalToConstant: 194),
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 52),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 28)
            ])
    }
    
    
    public override func updateViewConstraints() {
        super.updateViewConstraints()
        
        titleLabel.sizeToFit()
    }
    
}
