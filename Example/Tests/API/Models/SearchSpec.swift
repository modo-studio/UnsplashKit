import Foundation
import XCTest
import CoreLocation

@testable import UnsplashKit

final class SearchSpec: XCTestCase {
    
    func test_that_resource_photos_returns_the_correct_resource() {
        XCTAssertResource(resource: Search.photos(query: "query",
                                                  page: 3,
                                                  perPage: 33),
                          path: "/search/photos",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33",
                            "query": "query"
            ])
    }
    
    func test_that_resource_collections_returns_the_correct_resource() {
        XCTAssertResource(resource: Search.collections(query: "query",
                                                       page: 3,
                                                       perPage: 33),
                          path: "/search/collections",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33",
                            "query": "query"
            ])
    }
    
    func test_that_resource_users_returns_the_correct_resource() {
        XCTAssertResource(resource: Search.users(query: "query",
                                                 page: 3,
                                                 perPage: 33),
                          path: "/search/users",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33",
                            "query": "query"
            ])
    }
}
    
