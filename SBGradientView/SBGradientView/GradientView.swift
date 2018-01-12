import UIKit

public class GradientView : UIView {
    
    // MARK: - Types
    public enum Direction {
        case fromTop
        case fromBottom
        case fromLeft
        case fromRight
    }
    
    // MARK: - Properties
    let gradientLayer = CAGradientLayer()
    let direction: Direction
    let colors: [UIColor]
    
    public init(direction: Direction,
                colors: [UIColor] = [UIColor.black, UIColor.clear]) {
        
        // Set Properties
        self.direction = direction
        self.colors = colors
        
        // Init Super
        super.init(frame: .zero)
        
        // Setup
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        
        // Background Color
        backgroundColor = UIColor.clear
        
        // Add gradient layer
        layer.addSublayer(gradientLayer)
        gradientLayer.backgroundColor = UIColor.clear.cgColor
        updateGradientLayer()
    }
    
    // MARK: - Layout
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Update Gradient
    
    func updateGradientLayer() {
        updateStartAndEndPoints()
        updateColors()
        updateLocations()
    }
    
    func updateStartAndEndPoints() {
        
        switch direction {
        case .fromTop:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        case .fromBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 1)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        case .fromLeft:
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        case .fromRight:
            gradientLayer.startPoint = CGPoint(x: 1, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 0, y: 0.5)
        }
    }
    
    func updateColors() {
        
        // UIColor.clear doesn't display correctly, so we can recreate it
        let correctedColors = colors.map {
            $0 === UIColor.clear ? UIColor.init(white: 1, alpha: 0) : $0
        }
        
        var cgColors = [Any]()
        
        for color in correctedColors {
            cgColors.append(color.cgColor)
        }
        
        self.gradientLayer.colors = cgColors
    }
    
    func updateLocations() {
        
        assert(colors.count > 1, "A gradient cannot be constructed with less than two colors")
        
        var locations = [Double]()
        
        locations.append(0)
        for i in 1..<colors.count {
            locations.append( Double(i) / Double(colors.count-1) )
        }
        
        // Convert to NSNumber
        var nsNumberLocations = [NSNumber]()
        for value in locations {
            nsNumberLocations.append(NSNumber(value: value))
        }
        
    }
    
}

