#if canImport(UIKit)
import UIKit

extension Gradient {
    
    public enum Direction {
        case up
        case down
        case left
        case right
        case degree(CGFloat)
    }
}

public extension Gradient.Direction {
    
    var startPoint: CGPoint {
        switch self {
        case .up:
            return CGPoint(x: 0.5, y: 1.0)
        case .down:
            return CGPoint(x: 0.5, y: 0.0)
        case .left:
            return CGPoint(x: 1.0, y: 0.5)
        case .right:
            return CGPoint(x: 0.0, y: 0.5)
        case .degree(let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian + .pi) + 1), y: 0.5 * (1 + sin(radian)))
        }
    }
    
    var endPoint: CGPoint {
        switch self {
        case .up:
            return CGPoint(x: 0.5, y: 0.0)
        case .down:
            return CGPoint(x: 0.5, y: 1.0)
        case .left:
            return CGPoint(x: 0.0, y: 0.5)
        case .right:
            return CGPoint(x: 1.0, y: 0.5)
        case .degree(let degree):
            let radian = degree * .pi / 180
            return CGPoint(x: 0.5 * (cos(radian) + 1), y: 0.5 * (1 - sin(radian)))
        }
    }
}
#endif
