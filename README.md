# SBGradientView

[![Version](https://img.shields.io/cocoapods/v/SBGradientView.svg?style=flat)](http://cocoapods.org/pods/SBGradientView)
[![License](https://img.shields.io/cocoapods/l/SBGradientView.svg?style=flat)](http://cocoapods.org/pods/SBGradientView)
[![Platform](https://img.shields.io/cocoapods/p/SBGradientView.svg?style=flat)](http://cocoapods.org/pods/SBGradientView)

Convenient UIView wrapper around CAGradientLayer

## How to use

```
let colors = [UIColor.red, UIColor.orange, UIColor.green, UIColor.blue]
let gradientView = GradientView(direction: .fromTop, colors: colors)
```

![IMG](https://raw.githubusercontent.com/SteveBarnegren/SBGradientView/master/ScreenShots/Screenshot.png)

Four directions are supported:

```
public enum Direction {
        case fromTop
        case fromBottom
        case fromLeft
        case fromRight
    }
```

## Installation

**CocoaPods**

```ruby
pod "SBGradientView"
```

**Manual**

Copy ```GradientView.swift``` in to your project

## Author

[@SteveBarnegren](https://twitter.com/stevebarnegren)

## License

SBGradientView is available under the MIT license. See the LICENSE file for more info.
