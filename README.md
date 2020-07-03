
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://img.shields.io/cocoapods/p/Alamofire.svg?style=flat)](https://github.com/pseudozain/PseudoConstraints)
[![License: MIT](https://img.shields.io/badge/license-MIT-lightgrey.svg)](https://github.com/pseudozain/PseudoPieGraph/blob/master/LICENSE)

# PseudoPieGraph

PseudoPieGraph is light weight and simple pie graph. It's easy to integrate into iOS or Mac apps. One of th simplest pie graph out there.

![](/Resources/EmptyGraph.gif)

## Installation

PseudoPieGraph is available through Cocoapods and Carthage.

### CocoaPods Installation

To install PseudoPieGraph through CocoaPods add following to your podfile:

```ruby
pod 'PseudoPieGraph'
```

And run:

```ruby
pod install
``` 

### Carthage installation

To install PseudoPieGraph through CocoaPods add following to your cartfile:

```ruby
github "pseudozain/PseudoPieGraph"
```

And run:

```ruby
carthge update --plateform iOS
```

## Usage

PseudoPieGraph is easy to use and first import PseudoPieGraph to file where you want to use it:

```swift
import PsuedoPieGraph
```
Initialize PseudoPieGraph as ```lazy``` property or in Stroyboard/Xib file. Here example is give for initializing through code.

```swift
lazy var pieGraph: PseudoPieGraph = {
    let pieGraph = PseudoPieGraph()
    pieGraph.startAngleDeg = 45
    pieGraph.selectedArcEdge = -5
    pieGraph.emptyRadius = 0
    return pieGraph
}()
```

Add ```pieGraph``` to view in ```viewDidLoad(_ :)``` method.

```swift
override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(circledPieGraph)
}
```

Now set ```componets``` of pie graphs. And run your App.

```swift
override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    pieGraph.frame = CGRect(x: view.bounds.width/2 - 125, y: label.frame.origin.y + label.frame.height + 40, width: 250, height: 250)
    
    cpieGraph.components = [(number: 0.2, color: .orange), (number: 0.1, color: .systemBlue), (number: 0.15, color: .systemTeal), (number: 0.15, color: .systemRed), (number: 0.25, color: .purple), (number: 0.15, color: .systemPink)]
}
```

## Author

Zain ul Abe Din

## License

PseudoPieGraph is available under the MIT license. See the LICENSE file for more info.
