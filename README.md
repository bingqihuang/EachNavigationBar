# EachNavigationBar

[![CI Status](http://img.shields.io/travis/Pircate/EachNavigationBar.svg?style=flat)](https://travis-ci.org/Pircate/EachNavigationBar)
[![Version](https://img.shields.io/cocoapods/v/EachNavigationBar.svg?style=flat)](http://cocoapods.org/pods/EachNavigationBar)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/EachNavigationBar.svg?style=flat)](http://cocoapods.org/pods/EachNavigationBar)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)

[中文文档](https://github.com/Pircate/EachNavigationBar/blob/master/README_CN.md)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0+
* Swift 4

## Installation

EachNavigationBar is available through [CocoaPods](http://cocoapods.org) or [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your Podfile or Cartfile:

#### Podfile

```ruby
pod 'EachNavigationBar'
```

#### Cartfile
```ruby
github "Pircate/EachNavigationBar"
```

## Overview

![](https://github.com/Pircate/EachNavigationBar/blob/master/demo.gif)

## Usage

### Import

Swift
``` swift
import EachNavigationBar
```
Objective-C
``` ObjC
@import EachNavigationBar;
```

### Setup before window set rootViewController (Don't Forget)

Swift
``` swift
UIViewController.setupNavigationBar
```

Objective-C
``` ObjC
[UIViewController swizzle_setupNavigationBar];
```

### To enable EachNavigationBar of a navigation controller

Swift
``` swift
let nav = UINavigationController(rootViewController: vc)
nav.navigation.configuration.isEnabled = true
```

Objective-C
``` ObjC
UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
nav.global_configuration.isEnabled = YES;
```

### Setting
#### Global

Swift
``` swift
let nav = UINavigationController(rootViewController: vc)
nav.navigation.configuration.titleTextAttributes = [.foregroundColor: UIColor.blue]
nav.navigation.configuration.barTintColor = UIColor.red
nav.navigation.configuration.shadowImage = UIImage(named: "shadow")
nav.navigation.configuration.backImage = UIImage(named: "back")
nav.navigation.configuration.setBackgroundImage(UIImage(named: "nav"), for: .any, barMetrics: .default)
```

Objective-C
``` ObjC
UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
nav.global_configuration.titleTextAttributes = @{NSForegroundColorAttributeName: UIColor.blueColor};
nav.global_configuration.barTintColor = UIColor.redColor;
nav.global_configuration.shadowImage = [UIImage imageNamed:@"shadow"];
nav.global_configuration.backImage = [UIImage imageNamed:@"back"];
[self.navigationController.global_configuration setBackgroundImage:[UIImage imageNamed:@"nav"] for:UIBarPositionAny barMetrics:UIBarMetricsDefault];
```

#### Each view controller
##### normal

Swift
``` swift
navigation.bar  -> EachNavigationBar -> UINavigationBar
navigation.item -> UINavigationItem

// hide navigation bar
navigation.bar.isHidden = true

// set alpha
navigation.bar.alpha = 0.5

// remove blur effect
navigation.bar.isTranslucent = false

// hide bottom black line
navigation.bar.setShadowHidden(true)

// if you need to set status bar style lightContent
navigationController?.navigationBar.barStyle = .black

// if you want change navigation bar position
navigation.bar.isUnrestoredWhenViewWillLayoutSubviews = true

// navigation bar extra height
navigation.bar.extraHeight = 14

// custom back action
navigation.item.leftBarButtonItem?.action = #selector(backBarButtonAction)

// adjust navigation bar position when status bar appearance update
setNeedsStatusBarAppearanceUpdate()
adjustsNavigationBarPosition()
```

Objective-C
``` ObjC
self.each_navigationBar.xxx
self.each_navigationItem.xxx
```

##### largeTitle(iOS 11.0+)

Swift
``` swift
// enable
if #available(iOS 11.0, *) {
    navigationController?.navigation.configuration.prefersLargeTitles = true
}
// show
if #available(iOS 11.0, *) {
    navigation.setLargeTitleHidden(false)
}
// hide
if #available(iOS 11.0, *) {
    navigation.setLargeTitleHidden(true)
}
```

Objective-C
``` ObjC
// enable
if (@available(iOS 11.0, *)) {
    self.navigationController.global_configuration.prefersLargeTitles = YES;
}
// show
if (@available(iOS 11.0, *)) {
    [self each_setLargeTitleHidden:NO];
}
// hide
if (@available(iOS 11.0, *)) {
    [self each_setLargeTitleHidden:YES];
}
```

## Author

Pircate, gao497868860@163.com

## License

EachNavigationBar is available under the MIT license. See the LICENSE file for more info.
