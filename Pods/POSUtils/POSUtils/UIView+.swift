import Foundation
import UIKit

// MARK: - layer inspectable
public extension UIView {
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    public var roundCornerRadius: Bool {
        get { return self.roundCornerRadius }
        set {
            if newValue {
                layer.cornerRadius = frame.height / 2
            }
        }
    }

    @IBInspectable
    public var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    public var borderColor: UIColor {
        get {
            guard let cgColor = layer.borderColor else {
                return .black
            }

            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue.cgColor
        }
    }
}

// MARK: - gradient

public enum GradientOrientation {
    case horizontal, vertical
}

public extension UIView {
    public func addGradient(orientation: GradientOrientation = .horizontal,
                            locations: [NSNumber],
                            colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map{$0.cgColor}
        gradientLayer.locations = locations
        if orientation == .horizontal {
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        backgroundColor = .clear
        
        guard let sublayers = layer.sublayers else {
            layer.insertSublayer(gradientLayer, at: 0)
            return
        }
        sublayers.forEach {
            if $0 is CAGradientLayer {
                layer.replaceSublayer($0, with: gradientLayer)
            } else {
                layer.insertSublayer(gradientLayer, at: 0)
            }
        }
    }
}

// MARK: - sketch shadow

public extension UIView {
    public func applyShadow(cornerRadius: CGFloat = 0,
                            color: UIColor = .black,
                            shadowOpacity: Float = 0.5,
                            blur: CGFloat = 2,
                            size: CGSize=CGSize(width: 0, height: 1)
        ) {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowRadius = blur / 2
        layer.shadowColor = color.cgColor
        layer.shadowOffset = size
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
    public func removeShadow() {
        layer.shadowPath = nil
    }
}
