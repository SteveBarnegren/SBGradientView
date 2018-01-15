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
    
    public var direction: Direction {
        didSet { updateGradient() }
    }
    
    public var colors: [UIColor] {
        didSet { updateGradient() }
    }
    
    private let gradientLayer = CAGradientLayer()
    
    public init(direction: Direction,
                colors: [UIColor] = [UIColor.black, UIColor.clear]) {
        
        self.direction = direction
        self.colors = colors
        
        super.init(frame: .zero)
        
        backgroundColor = UIColor.clear
        
        // Add gradient layer
        layer.addSublayer(gradientLayer)
        gradientLayer.backgroundColor = UIColor.clear.cgColor
        updateGradient()
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
    
    private func updateGradient() {
        updateStartAndEndPoints()
        updateColors()
    }
    
    private func updateStartAndEndPoints() {
        
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
    
    private func updateColors() {
        
        // UIColor.clear doesn't display correctly, so we can recreate it
        let correctedColors = colors.map {
            $0 === UIColor.clear ? UIColor.init(white: 0.5, alpha: 0) : $0
        }
        
        var cgColors = [Any]()
        
        for color in correctedColors {
            cgColors.append(color.cgColor)
        }
        
        self.gradientLayer.colors = cgColors
    }
    
}

