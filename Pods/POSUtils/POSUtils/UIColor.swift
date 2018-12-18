import UIKit

public extension UIColor {
    public convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat = 1) {
        let red = interval(0, r, 255)
        let green = interval(0, g, 255)
        let blue = interval(0, b, 255)
        let alpha = interval(0, a, 1)
        
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    public func alpha(_ alpha: CGFloat) -> UIColor {
        return withAlphaComponent(alpha)
    }
}

private func interval<T: Comparable>(_ minimum: T, _ num: T, _ maximum: T) -> T {
    return min(maximum, max(minimum, num))
}
