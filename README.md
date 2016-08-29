![UnsplashKit: Unsplash API Client in Swift](assets/unsplash-kit-logo.png)

[![Build Status](https://travis-ci.org/carambalabs/UnsplashKit.svg?branch=master)](https://travis-ci.org/carambalabs/UnsplashKit)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/UnsplashKit.svg)](https://img.shields.io/cocoapods/v/UnsplashKit.svg)
[![codecov](https://codecov.io/gh/carambalabs/UnsplashKit/branch/master/graph/badge.svg)](https://codecov.io/gh/carambalabs/UnsplashKit)

Unsplash API client written in Swift using RxSwift.

[Unsplash](https://unsplash.com/) offers 2 APIs:
- [JSON API](https://unsplash.com/documentation) (5000 requests / hour)
- [Source API](https://source.unsplash.com/) (unlimited requests)

JSON API is in progress and will be available soon in this library.

## Usage

```swift
import UnsplashKit
```

### Source API

Source API allows you to get an Unsplash image in different ways.

#### Random photo

```swift
UnsplashClient().randomPhoto().subscribeNext { image in
  // handle the image
}
```

#### Random from a category

```swift
UnsplashClient().randomPhoto(fromCategory: .Nature).subscribeNext { image in
    // handle the image
}
```

Unsplash offers a list of predefined categories. You can ask for a photo from any of these categories.

```swift
.Buildings
.Food
.Nature
.People
.Technology
.Objects
```

#### Random from a specific user

```swift
UnsplashClient().randomPhoto(fromUser: "mkwlsn").subscribeNext { image in
    // handle the image
}
```

#### Random from a user's likes

```swift
UnsplashClient().randomPhoto(fromUserLikes: "mkwlsn").subscribeNext { image in
    // handle the image
}
```

#### Random from a collection

```swift
UnsplashClient().randomPhoto(fromCollection: "176316").subscribeNext { image in
    // handle the image
}
```

#### Random search term

```swift
UnsplashClient().randomPhoto(fromSearch: ["nature", "water"]).subscribeNext { image in
    // handle the image
}
```

#### Specific photo

```swift
UnsplashClient().photo("WLUHO9A_xik").subscribeNext { image in
    // handle the image
}
```

#### Specific image size

If you want to get an image of a specific size you can use the optional `size` parameter in any call.

```swift
UnsplashClient().randomPhoto(fromCategory: .Nature, size: CGSize(width: 600, height: 200)).subscribeNext { image in
    // handle the image
}
```

#### Fixed daily/weekly photo

The calls `random`, `search`, `category` and `user` can also be limited to only updating once per day or week. To do so, simply use the optional `filter` parameter.

```swift
UnsplashClient().randomPhoto(filter: .Daily).subscribeNext { image in
    // handle the image
}
```

### Handling Errors

To handle possible errors subscribe to the Error handler.

```swift
UnsplashClient().randomPhoto()
  .doOnNext{ image in
    // handle the image
  }
  .doOnError { error in
    // handle the error
  }
  .subscribe()
```

## Requirements

* iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
* Xcode 7.3+

## Installation

To install it, simply add the following line to your Podfile:

```ruby
pod "UnsplashKit"
```

## Caramba :heart: Open Source

We :heart: open sourcing at [Caramba](http://caramba.in). Check out our open [source projects](https://github.com/carambalabs/) and do not hesitate to contribute with them. We're looking for developers like you that help us to improve the projects we've been part of and contribute with the community.

If you're interested in contributing check out our [CONTRIBUTING](https://github.com/carambalabs/Foundation/blob/master/CONTRIBUTING.md) and code of [CONDUCT](https://github.com/carambalabs/Foundation/blob/master/CONDUCT.md)

Read [our blog](https://blog.caramba.in) or say hi on twitter ([@carambalabs](https://twitter.com/carambalabs)).

## License

UnsplashKit is available under the MIT license. See the LICENSE file for more info.
