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

var token = "0ef42c2ac1dd5a8c6eb60bed637ac670d86537df69d0fd987c4b882a5dadc498"
var client = UnsplashClient { request -> [String: String] in
    return [ "Authorization": "Bearer \(token)"]
}

/*:
## Requests
Models expose the requests that can be executed as resources. A resource contains the request, and how the response should be parsed. For example `User.me` returns the resource to fetch the authenticated user.
*/

print("📷 Unsplash API 📷")
client.execute(resource: User.me) { (result) in
    print("📷 Unsplash result: \(result)")
}

//: ### User
//: #### Fetching authenticated user
client.execute(resource: User.me) { (result) in
    if let userFirstName = result.value?.object.firstName {
        print("📷 User name: \(userFirstName)")
    }
}

//: #### Updating authenticated user

client.execute(resource: User.updateMe(firstName: "Pedro")) { (result) in
    if let userFirstName = result.value?.object.firstName {
        print("📷 Updated user name: \(userFirstName)")
    }
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [Next](@next)
