![UnsplashKit: Unsplash API Client in Swift](assets/unsplashkit-header.png)

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/UnsplashKit.svg)](https://img.shields.io/cocoapods/v/UnsplashKit.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Build Status](https://travis-ci.org/modo-studio/UnsplashKit.svg?branch=master)](https://travis-ci.org/carambalabs/UnsplashKit)
[![codecov](https://codecov.io/gh/modo-studio/UnsplashKit/branch/master/graph/badge.svg)](https://codecov.io/gh/carambalabs/UnsplashKit)

Unsplash API client written in Swift.

[Unsplash](https://unsplash.com/) offers 2 APIs:

- [Source API](https://source.unsplash.com/) (unlimited requests)
- [Official API](https://unsplash.com/documentation)
- [JSON API](https://unsplash.com/documentation) (5000 requests / hour)

JSON API is in progress and will be available soon in this library.

## Requirements

- iOS 8.0+ / Mac OS X 10.9+ / tvOS 9.0+ / watchOS 2.0+
- Xcode 8.0+

## Installation

You can use [CocoaPods](https://cocoapods.org) to integrate the library with your project.

```ruby
pod "UnsplashKit/API" # Official API
pod "UnsplashKit/Source" # Source API
```

## Usage

```swift
import UnsplashKit
```

### Official API

First thing you need is an instance of the client for executing requests and parsing responses from the API:

```swift
var token = "xxxx"
var client = UnsplashClient { request -> [String: String] in
    return [ "Authorization": "Bearer \(token)"]
}
```

Since the client supports providing headers for the requests, we'll use that closure to specify the authenticationt tokent that we want to pass in.

### Resources

Once the client is created you can use models' resources that contain the information about the request and about how to parse the JSON response into models whose properties you can access directly to. Here's an example:

```swift
let searchPhotos = Search.photos(query: "mountain")
client.execute(resource: searchPhotos) { (result) in
  print(result)
}
```

> The models that contain resources are, `User`, `Photo`, `Search`, `Collection`. These resources match the endpoints available from the API. If there's any new endpoint which is not supported, you can either create an issue or open a PR.

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
UnsplashSource().randomPhoto() { result in
  // handle the result
}
```

#### Random from a category

```swift
UnsplashSource().randomPhoto(fromCategory: .nature) { result in
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
UnsplashSource().randomPhoto(fromUser: "carambalabs") { result in
    // handle the result
}
```

#### Random from a user's likes

```swift
UnsplashSource().randomPhoto(fromUserLikes: "mkwlsn") { result in
    // handle the image
}
```

#### Random from a collection

```swift
UnsplashSource().randomPhoto(fromCollection: "176316") { result in
    // handle the result
}
```

#### Random search term

```swift
UnsplashSource().randomPhoto(fromSearch: ["nature", "water"]) { result in
    // handle the result
}
```

#### Specific photo

```swift
UnsplashSource().photo("WLUHO9A_xik") { result in
    // handle the result
}
```

#### Specific image size

If you want to get an image of a specific size you can use the optional `size` parameter in any call.

```swift
UnsplashSource().randomPhoto(fromCategory: .nature, size: CGSize(width: 600, height: 200)) { result in
    // handle the result
}
```

#### Fixed daily/weekly photo

The calls `random`, `search`, `category` and `user` can also be limited to only updating once per day or week. To do so, simply use the optional `filter` parameter.

```swift
UnsplashSource().randomPhoto(filter: .daily) { result in
    // handle the result
}
```

## About

<img src="https://github.com/modo-studio/Foundation/blob/master/ASSETS/modo-logo-salmon.png?raw=true" width="200" /><br/>

This project is funded and maintained by [Modo Studio](https://modo.studio). We 💛 open source software!

Check out our other [open source projects](https://github.com/modo-studio/), check out our [website](https://modo.studio) or say :wave: on twitter [@modostudio\_](http://twitter.com/modostudio_).

## Contribute

Contributions are welcome :metal: We encourage developers like you to help us improve the projects we've shared with the community. Please see the [Contributing Guide](https://github.com/modo-studio/Foundation/blob/master/CONTRIBUTING.md) and the [Code of Conduct](https://github.com/modo-studio/Foundation/blob/master/CONDUCT.md).

## License

UnsplashKit is available under the MIT license. See the LICENSE file for more info.
