# SweetLike

[![CI Status](https://img.shields.io/travis/demirciy/SweetLike.svg?style=flat)](https://travis-ci.org/demirciy/SweetLike)
[![Version](https://img.shields.io/cocoapods/v/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)
[![License](https://img.shields.io/cocoapods/l/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)
[![Platform](https://img.shields.io/cocoapods/p/SweetLike.svg?style=flat)](https://cocoapods.org/pods/SweetLike)

# Demo

![alt tag](https://media.giphy.com/media/UWc65S9RjZL3DE399c/giphy.gif)

## Requirements

 - iOS 10.0+
 - Xcode 8.0+
 - Swift 3.0+

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
sweetLikeButton.likeActionCompletion = {}
sweetLikeButton.unlikeActionCompletion = {}
```

with delegate(SweetLikeDelegate):

```ruby
func likeAction() {}
func unlikeAction() {}
```

There are a few properties you may change:

| Property                        | Description                                            | Type    | Default Value |
|:--------------------------------|:-------------------------------------------------------|:--------|:--------------|
| IBInspectable likeImage         | The image that shows when liked                        | UIImage |               |
| IBInspectable unlikeImage       | The image that shows when unliked                      | UIImage |               |
| likeActionAnimationDuration     | The duration of total like animation                   | Double  |      0.6      |
| unlikeActionAnimationDuration   | The duration of total unlike animation                 | Double  |      0.15     |
| isAnimationEnabled              | The boolean if animating enabled or disabled           | Bool    |      true     |

## Author

Yusuf Demirci, demirciy94@gmail.com

## License

SweetLike is available under the MIT license. See the LICENSE file for more info.
