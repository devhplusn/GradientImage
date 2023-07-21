#if canImport(UIKit)
import UIKit

public final class Gradient {
    
    private let _layer = CAGradientLayer()
    private var isChanged = true
    private var tempImage: UIImage? = nil
    
    public init(size: CGSize = .zero, start: CGPoint = .zero, end: CGPoint = .zero, cgColors: [CGColor] = [], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self._layer.frame = CGRect(origin: .zero, size: size)
        self._layer.startPoint = start
        self._layer.endPoint = end
        self._layer.colors = cgColors
        self._layer.locations = locations
        self._layer.type = type
    }
    
    public convenience init(size: CGSize = .zero, direction: Direction, cgColors: [CGColor] = [], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: size, start: direction.startPoint, end: direction.endPoint, cgColors: cgColors, locations: locations, type: type)
    }
    
    public convenience init(size: CGSize = .zero, start: CGPoint = .zero, end: CGPoint = .zero, colors: [UIColor], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: size, start: start, end: end, cgColors: colors.map { $0.cgColor }, locations: locations, type: type)
    }
    
    public convenience init(size: CGSize = .zero, direction: Direction, colors: [UIColor], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: size, start: direction.startPoint, end: direction.endPoint, cgColors: colors.map { $0.cgColor }, locations: locations, type: type)
    }
    
    public convenience init(view: UIView, start: CGPoint = .zero, end: CGPoint = .zero, cgColors: [CGColor] = [], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: view.frame.size, start: start, end: end, cgColors: cgColors, locations: locations, type: type)
    }
    
    public convenience init(view: UIView, direction: Direction, cgColors: [CGColor] = [], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: view.frame.size, start: direction.startPoint, end: direction.endPoint, cgColors: cgColors, locations: locations, type: type)
    }
    
    public convenience init(view: UIView, start: CGPoint = .zero, end: CGPoint = .zero, colors: [UIColor], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: view.frame.size, start: start, end: end, colors: colors, locations: locations, type: type)
    }
    
    public convenience init(view: UIView, direction: Direction, colors: [UIColor], locations: [NSNumber]? = nil, type: CAGradientLayerType = .axial) {
        self.init(size: view.frame.size, start: direction.startPoint, end: direction.endPoint, colors: colors, locations: locations, type: type)
    }
    
    /// An array of CGColorRef objects defining the color of each gradient stop.
    public var colors: [CGColor] {
        layer.colors as? [CGColor] ?? []
    }
    
    /// An optional array of NSNumber objects defining the location of each gradient stop.
    public var locations: [NSNumber]? {
        layer.locations
    }
    
    /// Style of gradient drawn by the layer.
    public var type: CAGradientLayerType {
        layer.type
    }
    
    public var size: CGSize {
        layer.frame.size
    }
    
    /// Returns CAGradientLayer new instance by Gradient configuration.
    public var layer: CAGradientLayer {
        let result = CAGradientLayer()
        result.frame = _layer.frame
        result.startPoint = _layer.startPoint
        result.endPoint = _layer.endPoint
        result.colors = _layer.colors
        result.locations = _layer.locations
        result.type = _layer.type
        return result
    }
    
    /// Returns UIImage by Gradient configuration.
    public var image: UIImage? {
        isChanged || tempImage == nil ? generate() : tempImage
    }
    
    /// Returns UIColor by Gradient configuration.
    public var color: UIColor? {
        guard let img = image else { return nil }
        return UIColor(patternImage: img)
    }
    
    private func generate() -> UIImage? {
        var gradientImage: UIImage?
        UIGraphicsBeginImageContext(_layer.frame.size)
        if let context = UIGraphicsGetCurrentContext() {
            _layer.render(in: context)
            gradientImage = UIGraphicsGetImageFromCurrentImageContext()?.resizableImage(withCapInsets: UIEdgeInsets.zero, resizingMode: .stretch)
        }
        UIGraphicsEndImageContext()
        tempImage = gradientImage
        isChanged = false
        return tempImage
    }
    
    private func didSetProperty() -> Gradient {
        isChanged = true
        return self
    }
}


// MARK: - Setter
extension Gradient {
    
    @discardableResult
    public func set(size: CGSize) -> Gradient {
        self._layer.frame = CGRect(origin: .zero, size: size)
        return didSetProperty()
    }
    
    @discardableResult
    public func set(view: UIView) -> Gradient {
        self.set(size: view.bounds.size)
    }
    
    @discardableResult
    public func set(start: CGPoint) -> Gradient {
        self._layer.startPoint = start
        return didSetProperty()
    }
    
    @discardableResult
    public func set(end: CGPoint) -> Gradient {
        self._layer.endPoint = end
        return didSetProperty()
    }
    
    @discardableResult
    public func set(direction: Direction) -> Gradient {
        self.set(start: direction.startPoint)
            .set(end: direction.endPoint)
    }
    
    @discardableResult
    public func set(cgColors: [CGColor]) -> Gradient {
        self._layer.colors = cgColors
        return didSetProperty()
    }
    
    @discardableResult
    public func set(colors: [UIColor]) -> Gradient {
        self.set(cgColors: colors.map { $0.cgColor })
    }
    
    @discardableResult
    public func set(locations: [NSNumber]?) -> Gradient {
        self._layer.locations = locations
        return didSetProperty()
    }
    
    @discardableResult
    public func set(type: CAGradientLayerType) -> Gradient {
        self._layer.type = type
        return didSetProperty()
    }
    
}
#endif
