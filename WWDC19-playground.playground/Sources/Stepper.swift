import UIKit

public
class Stepper: UIView {
    
    public lazy
    var topButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 6))
        
        button.setImage(Images.arrowUp, for: [])
        button.tintColor = Colors.gray
        button.addTarget(self, action: #selector(incrementCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public lazy
    var bottomButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 12, height: 6))
        
        button.setImage(Images.arrowDown, for: [])
        button.tintColor = Colors.blue
        button.isEnabled = false
        button.addTarget(self, action: #selector(decrementCount), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    public
    var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 11, height: 20))
        
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        label.textColor = Colors.blue
        label.text = "0"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    public
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 12, height: 53))
        
        setUp()
    }
    
    public required convenience
    init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    @objc private
    func incrementCount() {
        guard
            let text = label.text,
            let value = Int(text)
            else { return }
        label.text = String(min(value + 1, 9))
        
        if label.text == "9" { topButton.isEnabled = false }
        else { topButton.isEnabled = true }
        
        bottomButton.isEnabled = true
    }
    
    @objc private
    func decrementCount() {
        guard
            let text = label.text,
            let value = Int(text)
            else { return }
        label.text = String(max(value - 1, 0))
        
        if label.text == "0" { bottomButton.isEnabled = false }
        else { bottomButton.isEnabled = true }
        
        topButton.isEnabled = true
    }
    
    private
    func setUp() {
        translatesAutoresizingMaskIntoConstraints = false
        
        setUpViewHierarchy()
        setUpConstraints()
    }
    
    private
    func setUpViewHierarchy() {
        addSubview(topButton)
        addSubview(label)
        addSubview(bottomButton)
    }
    
    private
    func setUpConstraints() {
        
        // Stepper size constraints
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 12)
                .identifiedBy("Stepper-width"),
            heightAnchor.constraint(equalToConstant: 53)
                .identifiedBy("Stepper-height")
            ])
        
        // Top button size constraints
        NSLayoutConstraint.activate([
//            topButton.widthAnchor.constraint(equalToConstant: 12).identifiedBy("topButton-width"),
//            topButton.heightAnchor.constraint(equalToConstant: 6).identifiedBy("topButton-height"),
            topButton.widthAnchor.constraint(equalTo: topButton.heightAnchor, multiplier: 2)
                .identifiedBy("topButton.widthAnchor = 2 * topButton.heightAnchor")
            ])
        
        // Bottom button size constraints
        NSLayoutConstraint.activate([
//            bottomButton.widthAnchor.constraint(equalToConstant: 12).identifiedBy("bottomButton-width"),
//            bottomButton.heightAnchor.constraint(equalToConstant: 6).identifiedBy("bottomButton-height"),
            bottomButton.widthAnchor.constraint(equalTo: bottomButton.heightAnchor, multiplier: 2)
                .identifiedBy("bottomButton.widthAnchor = 2 * bottomButton.heightAnchor")
            ])
        
        // Vertical constraints
        NSLayoutConstraint.activate([
            topButton.topAnchor.constraint(equalTo: topAnchor)
                .identifiedBy("topButton.topAnchor = Stepper.topAnchor"),
            topButton.bottomAnchor.constraint(equalTo: label.topAnchor)
                .identifiedBy("topButton.bottomAnchor = label.topAnchor"),
            label.bottomAnchor.constraint(equalTo: bottomButton.topAnchor)
                .identifiedBy("label.bottomAnchor = bottomButton.topAnchor"),
            bottomButton.bottomAnchor.constraint(equalTo: bottomAnchor)
                .identifiedBy("bottomButton.topAnchor = Stepper.bottomAnchor")
            ])
        
        // Horizontal constraints
        NSLayoutConstraint.activate([
            // Equal widths
            topButton.widthAnchor.constraint(equalTo: widthAnchor)
                .identifiedBy("topButton.widthAnchor = Stepper.widthAnchor"),
            label.widthAnchor.constraint(equalTo: widthAnchor)
                .identifiedBy("label.widthAnchor = Stepper.widthAnchor"),
            bottomButton.widthAnchor.constraint(equalTo: widthAnchor)
                .identifiedBy("bottomButton.widthAnchor = widthAnchor"),
            // Centered
            topButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("topButton.centerXAnchor = centerXAnchor"),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("label.centerXAnchor = centerXAnchor"),
            bottomButton.centerXAnchor.constraint(equalTo: centerXAnchor)
                .identifiedBy("bottomButton.centerXAnchor = centerXAnchor")
            ])
        
    }
    
}
