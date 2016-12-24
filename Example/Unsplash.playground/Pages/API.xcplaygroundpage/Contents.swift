//: [Previous](@previous)

import Foundation
import UnsplashKit
import XCPlayground

/*:
 # Unsplash Official API
 */

/*:
## Creating the client
The first thing we have to do is create an API client that will execute the resources against the API and return the parsed responses asynchronously.
> UnsplashClient supports passing a closure that returns extra headers to be inserted in a given request. For example, these headers can contain the user authentication in the Authorization header.
*/

var token = ""
var client = UnsplashClient { request -> [String: String] in
    return [ "Authorization": "Bearer \(token)"]
}

/*:
## Requests
Models expose the requests that can be executed as resources. A resource contains the request, and how the response should be parsed. For example `User.me` returns the resource to fetch the authenticated user.
*/

//client.execute(resource: User.me) { (result) in
//    if let userFirstName = result.value?.object.firstName {
//        print("📷 User name: \(userFirstName)")
//    }
//}

//: - Fetch authenticated user `User.me`.
//: - Update authenticated user `User.updateMe`.
//: - Get user `User.get`.
//: - Get user portfolio `User.portfolio`.

client.execute(resource: Photo.like(id: "1SwxVPbpAOE")) { (result) in
    print(result)
    if let value = result.value?.object {
        dump(value)
    }
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next](@next)
