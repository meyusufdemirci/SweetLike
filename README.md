# SweetLike

[![CI Status](https://img.shields.io/travis/demirciy/SweetLike.svg?style=flat)](https://travis-ci.com/demirciy/SweetLike)
[![Version](https://img.shields.io/cocoapods/v/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)
[![License](https://img.shields.io/cocoapods/l/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)
[![Platform](https://img.shields.io/cocoapods/p/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)

# Demo

![alt tag](https://media.giphy.com/media/UWc65S9RjZL3DE399c/giphy.gif)

## Requirements

 - iOS 10.0+
 - Xcode 11.0+
 - Swift 5.0+

## Installation

SweetLike is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SweetLike'
```

## Usage

Create,

on storyboard:

```ruby
@IBOutlet weak var sweetLikeButton: SweetLike!
```

or programmatically:

```ruby
let sweetLikeButton = SweetLike()
```

To get like and unlike actions,

with completion:

```ruby
sweetLikeButton.likeAction = {}
sweetLikeButton.unlikeAction = {}
```

with delegate(SweetLikeDelegate):

```ruby
func likeAction() {}
func unlikeAction() {}
```

There are a few properties you may change:

| Property                        | Description                                               | Type    | Default Value       |
|:--------------------------------|:----------------------------------------------------------|:--------|:--------------------|
| IBInspectable likedImage | The image that shows when liked | UIImage | named: likedAsset |
| IBInspectable unlikedImage | The image that shows when unliked| UIImage| named: unlikedAsset |
| IBInspectable likedColor | The color of the default liked image | UIColor | UIColor(red: 201/255, green: 97/255, blue: 80/255, alpha: 1) |
| IBInspectable unlikedColor | The color of the default unliked image | UIColor | UIColor(red: 201/255, green: 97/255, blue: 80/255, alpha: 1) |
| likeActionAnimationDuration | The duration of like animation | Double | 0.6 |
| unlikeActionAnimationDuration | The duration of unlike animation | Double | 0.15 |
| isAnimationEnabled | The boolean that states the animating enabled or disabled | Bool | true |

## Author

Yusuf Demirci, demirciy94@gmail.com

## License

SweetLike is available under the MIT license. See the LICENSE file for more info.
