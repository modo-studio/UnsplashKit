![UnsplashKit: Unsplash API Client in Swift](assets/unsplashkit-header.png)

[![Build Status](https://travis-ci.org/carambalabs/UnsplashKit.svg?branch=master)](https://travis-ci.org/carambalabs/UnsplashKit)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/UnsplashKit.svg)](https://img.shields.io/cocoapods/v/UnsplashKit.svg)
[![codecov](https://codecov.io/gh/carambalabs/UnsplashKit/branch/master/graph/badge.svg)](https://codecov.io/gh/carambalabs/UnsplashKit)

Unsplash API client written in Swift.

[Unsplash](https://unsplash.com/) offers 2 APIs:
- [Source API](https://source.unsplash.com/) (unlimited requests)
- [JSON API](https://unsplash.com/documentation) (5000 requests / hour)

JSON API is in progress and will be available soon in this library.

## Usage

```swift
import UnsplashKit
```

### Source API

Source API allows you to get an Unsplash image in different ways.

#### Results

All the calls return the image through a completion block that returns a `Result<Image, Error>`.
```swift
call() { result in
  switch result {
    case .success(let image): //handle image
    case .failure(let error): //handle error
  }
}
```

You can also ignore the error and get only the result using
```swift
call() { result in
  let image = result.value
}
```

#### Random photo

```swift
UnsplashClient().randomPhoto() { result in
  // handle the result
}
```

#### Random from a category

```swift
UnsplashClient().randomPhoto(fromCategory: .nature) { result in
    // handle the result
}
```

Unsplash offers a list of predefined categories. You can ask for a photo from any of these categories.

```swift
.buildings
.food
.nature
.people
.technology
.objects
```

#### Random from a specific user

```swift
UnsplashClient().randomPhoto(fromUser: "carambalabs") { result in
    // handle the result
}
```

#### Random from a user's likes

```swift
UnsplashClient().randomPhoto(fromUserLikes: "mkwlsn") { result in
    // handle the image
}
```

#### Random from a collection

```swift
UnsplashClient().randomPhoto(fromCollection: "176316") { result in
    // handle the result
}
```

#### Random search term

```swift
UnsplashClient().randomPhoto(fromSearch: ["nature", "water"]) { result in
    // handle the result
}
```

#### Specific photo

```swift
UnsplashClient().photo("WLUHO9A_xik") { result in
    // handle the result
}
```

#### Specific image size

If you want to get an image of a specific size you can use the optional `size` parameter in any call.

```swift
UnsplashClient().randomPhoto(fromCategory: .nature, size: CGSize(width: 600, height: 200)) { result in
    // handle the result
}
```

#### Fixed daily/weekly photo

The calls `random`, `search`, `category` and `user` can also be limited to only updating once per day or week. To do so, simply use the optional `filter` parameter.

```swift
UnsplashClient().randomPhoto(filter: .daily) { result in
    // handle the result
}
```

## Requirements

* iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
* Xcode 7.3+

## Installation

To install it, simply add the following line to your Podfile:

```ruby
pod "UnsplashKit"
```

## About

<img src="https://github.com/carambalabs/Foundation/blob/master/ASSETS/avatar_rounded.png?raw=true" width="70" />

This project is funded and maintained by [Caramba](http://caramba.io). We 💛 open source software!

Check out our other [open source projects](https://github.com/carambalabs/), read our [blog](http://blog.caramba.io) or say :wave: on twitter [@carambalabs](http://twitter.com/carambalabs).

## Contribute

Contributions are welcome :metal: We encourage developers like you to help us improve the projects we've shared with the community. Please see the [Contributing Guide](https://github.com/carambalabs/Foundation/blob/master/CONTRIBUTING.md) and the [Code of Conduct](https://github.com/carambalabs/Foundation/blob/master/CONDUCT.md).

## License

UnsplashKit is available under the MIT license. See the LICENSE file for more info.
