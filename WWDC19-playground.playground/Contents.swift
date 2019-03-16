//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    override func loadView() {
        let info = FlightInformationCell()
        info.bottomGlyph.image = Images.airplaneGlyph
        info.topGlyph.image = Images.calendarGlyph
        info.topLabel.text = "From"
        info.middleLabel.text = "GIG"
        info.bottomLabel.text = "12+ years"
        view = info
    }
    
}

//let info = FlightInformationCell()
//info.bottomGlyph.image = Images.airplaneGlyph
//info.topGlyph.image = Images.calendarGlyph
//info.topLabel.text = "From"
//info.middleLabel.text = "GIG"
//info.bottomLabel.text = "12+ years"
let vc = MyViewController()
let window = UIWindow(frame: CGRect(x: 0, y: 0, width: 170, height: 116))

window.rootViewController = vc
window.makeKeyAndVisible()

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = window

