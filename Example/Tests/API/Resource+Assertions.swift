import Foundation
import XCTest
@testable import UnsplashKit

internal func XCTAssertResource<T>(resource: Resource<T>,
                                path: String,
                                method: String,
                                parameters: [String: Any] = [:]) {
    let request = resource.request(URLComponents(string: "https://test.com")!)
    XCTAssertEqual(request.httpMethod, method)
    let components = URLComponents(url: request.url!, resolvingAgainstBaseURL: true)
    XCTAssertEqual(components?.path, path)
    XCTAssertEqual((components?.queryItems ?? []).map({$0.name}).sorted(), parameters.map({$0.key}).sorted())
    for key in parameters.keys {
        let queryItem: URLQueryItem! = components?.queryItems?.filter { $0.name == key }.first
        XCTAssertNotNil(queryItem)
        let gotValue = queryItem.value
        let expectedValue = parameters[key]! as? String
        XCTAssertEqual(gotValue, expectedValue)
    }
}
