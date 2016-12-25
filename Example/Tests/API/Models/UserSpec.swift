import Foundation
import XCTest

@testable import UnsplashKit

final class UserSpec: XCTestCase {
    
    func test_that_resource_me_show_returns_the_correct_resource() {
        XCTAssertResource(resource: User.me,
                          path: "/me",
                          method: "GET")
    }
    
    func test_that_resource_me_update_returns_the_correct_resource() {
        XCTAssertResource(resource: User.updateMe(username: "username",
                                                  firstName: "first_name",
                                                  lastName: "last_name",
                                                  email: "email",
                                                  url: "url",
                                                  location: "location",
                                                  bio: "bio",
                                                  instagramUsername: "instagram_username"),
                          path: "/me",
                          method: "PUT",
                          parameters: [
                            "username": "username",
                            "first_name": "first_name",
                            "last_name": "last_name",
                            "email": "email",
                            "url": "url",
                            "location": "location",
                            "bio": "bio",
                            "instagram_username": "instagram_username"
            ])
    }
    
    func test_that_resource_user_with_id_show_returns_the_correct_resource() {
        XCTAssertResource(resource: User.get(username: "333", size: CGSize(width: 20, height: 20)),
                          path: "/users/333",
                          method: "GET",
                          parameters: [
                        "w": "20.0",
                        "h": "20.0"
            ])
    }
    
    func test_that_resource_user_portfolio_show_returns_the_correct_resource() {
        XCTAssertResource(resource: User.portfolio(username: "333"),
                          path: "/users/333/portfolio",
                          method: "GET")
    }
    
    func test_that_resource_user_photos_list_returns_the_correct_resource() {
        XCTAssertResource(resource: User.photos(username: "333",
                                                page: 22,
                                                perPage: 50,
                                                orderBy: .latest),
                          path: "/users/333/photos",
                          method: "GET",
                          parameters: [
                            "page": "22",
                            "per_page": "50",
                            "order_by": "latest"
            ])
    }
    
    func test_that_resource_user_liked_photos_returns_the_correct_resource() {
        XCTAssertResource(resource: User.likes(username: "333",
                                               page: 22,
                                               perPage: 50,
                                               orderBy: .latest),
                          path: "/users/333/likes",
                          method: "GET",
                          parameters: [
                            "page": "22",
                            "per_page": "50",
                            "order_by": "latest"
            ])
    }
    
    func test_that_resource_user_collections_returns_the_correct_resource() {
        XCTAssertResource(resource: User.collections(username: "333",
                                                     page: 22,
                                                     perPage: 50,
                                                     orderBy: .latest),
                          path: "/users/333/collections",
                          method: "GET",
                          parameters: [
                            "page": "22",
                            "per_page": "50",
                            "order_by": "latest"
            ])
    }
}
