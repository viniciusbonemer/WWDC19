//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    lazy var buttonGroup: ExclusiveButtonGroup = ExclusiveButtonGroup(titles: "First", "Second", "Third")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(buttonGroup)
        view.backgroundColor = Colors.white
        
        NSLayoutConstraint.activate([
            buttonGroup.widthAnchor.constraint(equalToConstant: 303),
            buttonGroup.heightAnchor.constraint(equalToConstant: 42),
            buttonGroup.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonGroup.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 561)
            ])
    }
    
}

//let info = FlightInformationCell()
//info.bottomGlyph.image = Images.airplaneGlyph
//info.topGlyph.image = Images.calendarGlyph
//info.topLabel.text = "From"
//info.middleLabel.text = "GIG"
//info.bottomLabel.text = "12+ years"
let vc = MyViewController()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = vc

vc.buttonGroup.frame
vc.buttonGroup.buttons.forEach({print($0.frame)})
vc.buttonGroup.safeAreaInsets
vc.buttonGroup.constraints.forEach { (constraint) in
    print(constraint.identifier)
}
