# KBNumberPad (iOS)

[![CI Status](http://img.shields.io/travis/kbiakov/KBNumberPad.svg?style=flat)](https://travis-ci.org/kbiakov/KBNumberPad)
[![Version](https://img.shields.io/cocoapods/v/KBNumberPad.svg?style=flat)](http://cocoapods.org/pods/KBNumberPad)
[![License](https://img.shields.io/cocoapods/l/KBNumberPad.svg?style=flat)](http://cocoapods.org/pods/KBNumberPad)
[![Platform](https://img.shields.io/cocoapods/p/KBNumberPad.svg?style=flat)](http://cocoapods.org/pods/KBNumberPad)

<b>KBNumberPad</b> is a customizable number pad as replacement of default.

## Example
To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
- Xcode 8.0+
- iOS 9.0+
- Swift 3.0+

## Setup

### CocoaPods
<b>KBNumberPad</b> is available through [CocoaPods](http://cocoapods.org), dependency manager for Cocoa projects. To install it, run the command:
```bash
$ gem install cocoapods
```

To integrate <b>KBNumberPad</b> into your Xcode project using CocoaPods, specify it in your `Podfile`:
```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'KBNumberPad', '~> 1.0.1'
end
```

Then, run the following command:
```bash
$ pod install
```

## Usage

1. Create input view (and customize, see section below):
```Swift
let numberPad = KBNumberPad()
```

2. Set as input view for your text field (or other):
```Swift
textField.inputView = numberPad
```

3. Set delegate:
```Swift
numberPad.delegate = self
```

4. Define behavior of 3 callbacks:
```Swift
func onNumberClicked(numberPad: KBNumberPad, number: Int) {}
func onDoneClicked(numberPad: KBNumberPad) {}
func onClearClicked(numberPad: KBNumberPad) {}
```

### Customization
You can customize base components of this number pad view as follows:
```Swift
numberPad.setDelimiterColor(UIColor.lightGray)
numberPad.setButtonsColor(UIColor.black)
numberPad.setButtonsBackgroundColor(UIColor.white)
```

This snippet shows that all buttons grouped, but there are methods to do setup separately like:
```Swift
numberPad.setNumberButtonsColor(UIColor.black)
numberPad.setClearButtonColor(UIColor.darkGray)
numberPad.setDoneButtonColor(UIColor.darkGray)
```

There is params to customize: it's __color__ of grouped or all buttons, __font__ & __background__.
Also you can change the __icon__ for clear button.

## Screenshots
[![2017-05-14_20.29.02.png](https://s3.postimg.org/r1fswvhg3/2017-05-14_20.29.02.png)](https://postimg.org/image/7wcjn42rz/)
[![2017-05-14_20.51.04.png](https://s13.postimg.org/f7akftz3b/2017-05-14_20.51.04.png)](https://postimg.org/image/qwek3sq1v/)
[![2017-05-14_20.59.17.png](https://s12.postimg.org/518601cm5/2017-05-14_20.59.17.png)](https://postimg.org/image/jx6p7mo0p/)

## Author
### [Kirill Biakov](https://github.com/kbiakov)

## License
<b>KBNumberPad</b> is available under the [Apache License 2.0](https://github.com/kbiakov/KBNumberPad/blob/master/LICENSE) license.
