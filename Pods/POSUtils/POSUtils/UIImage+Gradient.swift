import UIKit

// MARK: - UIImage + Gradient

public extension UIImage {
    public convenience init?(orientation: GradientOrientation = .horizontal,
                      locations: [NSNumber],
                      colors: [UIColor],
                      size: CGSize) {
        let gradient = gradientLayer(orientation: orientation, locations: locations, colors: colors, size: size)
        guard let image = image(from: gradient, size: size),
            let cgImage = image.cgImage else {
                return nil
        }
        
        self.init(cgImage: cgImage)
    }
}

private func image(from gradientLayer: CAGradientLayer, size: CGSize) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(size, true, 1)
    guard let context = UIGraphicsGetCurrentContext() else {
        return nil
    }
    gradientLayer.render(in: context)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
}

private func gradientLayer(orientation: GradientOrientation, locations: [NSNumber], colors: [UIColor], size: CGSize) -> CAGradientLayer {
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = CGRect(origin: .zero, size: size)
    gradientLayer.colors = colors.map{$0.cgColor}
    gradientLayer.locations = locations
    if orientation == .horizontal {
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
    }
    
    return gradientLayer
}

// MARK: - UIImage + Color

public extension UIImage {
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
