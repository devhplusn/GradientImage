# GradientImage

[![Swift](https://img.shields.io/badge/Swift-5-orange.svg)](https://img.shields.io/badge/Swift-5-orange.svg)
[![Platforms](https://img.shields.io/badge/Platforms-iOS-black?style=flat)](https://img.shields.io/badge/Platforms-iOS-black?style=flat)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://github.com/devhplusn/GradientImage/blob/master/LICENSE)

GradientImage is a library that easily generates gradient colors and images using the method chain pattern.

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)

## Requirements

- Swift 5.0
- iOS 13.0+


## Installation

#### Swift Package Manager

You can use The Swift Package Manager to install GradientImage by adding the proper description to your Package.swift file:

```swift
import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/devhplusn/GradientImage.git", from: "1.0.0")
    ]
)
```

#### Cocoapods

GradientImage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod 'GradientImage', :tag => '1.0.0', :git => 'https://github.com/devhplusn/GradientImage'
```


## Usage

#### Gradient Configuration

Gradient can set size, startPoint, endPoint, colors and locations.

```swift
let gradient = Gradient(size: .zero, direction: .down)
            .set(size: CGSize(width: 100, height: 100))
            .set(view: UIImageView())
            .set(start: .zero)
            .set(end: CGPoint(x: 1, y: 1))
            .set(direction: .down)
            .set(cgColors: [UIColor.black.cgColor, UIColor.red.cgColor])
            .set(colors: [.black, .gray, .darkGray])
            .set(locations: [0.1, 0.2, 0.5])

```

#### Properties

> UIImage (Optional)

```swift
let image: UIImage? = Gradient(size: CGSize(width: 100, height: 100), direction: .down).image

```

> UIColor (Optional)

```swift
let color: UIColor? = Gradient(size: CGSize(width: 100, height: 100), direction: .down).color

```

> CAGradientLayer

```swift
let gradientLayer: CAGradientLayer = Gradient(size: CGSize(width: 100, height: 100), direction: .down).layer

```

## License

These works are available under the MIT license. See the [LICENSE][license] file
for more info.


[license]: LICENSE
