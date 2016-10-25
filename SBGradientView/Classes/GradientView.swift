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
                colors: [UIColor] = [UIColor.black, UIColor.clear]
        ) {
        
        // Set Properties
        self.direction = direction
        self.colors = colors
        
        // Init Super
        super.init(frame: .zero)
        
        // Background Color
        backgroundColor = UIColor.clear
        
        // Add gradient layer
        layer.addSublayer(gradientLayer)
        updateGradientLayer()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func updateColors() {
        
        var cgColors = [Any]()
        
        for color in colors {
            cgColors.append(color.cgColor)
        }
        
        self.gradientLayer.colors = cgColors
    }
    
    func updateLocations() {
        
        assert(colors.count > 1, "A gradient cannot be constructed with less than two colors")
        
        // For now, we just support linear distibution!
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

