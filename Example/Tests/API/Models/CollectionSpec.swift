import Foundation
import XCTest
import CoreLocation

@testable import UnsplashKit

final class CollectionSpec: XCTestCase {
    
    func test_that_resource_list_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.list(page: 3,
                                                    perPage: 33),
                          path: "/collections",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33"
            ])
    }
    
    func test_that_resource_featured_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.featured(page: 3,
                                                        perPage: 33),
                          path: "/collections/featured",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33"
            ])
    }
    
    func test_that_resource_get_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.get(id: "333"),
                          path: "/collections/333",
                          method: "GET",
                          parameters: [:])
    }
    
    func test_that_resource_photos_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.photos(id: "333",
                                                      page: 3,
                                                      perPage: 33),
                          path: "/collections/333/photos",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33"])
    }
    
    func test_that_resource_curated_photos_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.curatedPhotos(id: "333",
                                                             page: 3,
                                                             perPage: 33),
                          path: "/collections/curated/333/photos",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33"])
    }
    
    func test_that_resource_related_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.related(id: "333"),
                          path: "/collections/333/related",
                          method: "GET",
                          parameters: [:])
    }
    
    func test_that_resource_create_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.create(title: "test",
                                                      description: "description",
                                                      isPrivate: true),
                          path: "/collections",
                          method: "POST",
                          parameters: [
                            "title": "test",
                            "description": "description",
                            "private": "true"])
    }
    
    func test_that_resource_update_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.update(id: "333",
                                                      title: "test",
                                                      description: "description",
                                                      isPrivate: true),
                          path: "/collections/333",
                          method: "PUT",
                          parameters: [
                            "title": "test",
                            "description": "description",
                            "private": "true"])
    }
    
    func test_that_resource_delete_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.delete(id: "333"),
                          path: "/collections/333",
                          method: "DELETE",
                          parameters: [:])
    }
    
    func test_that_resource_add_photo_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.addPhoto(with: "333",
                                                        to: "444"),
                          path: "/collections/444/add",
                          method: "POST",
                          parameters: [
                            "photo_id": "333"])
    }
    
    func test_that_resource_delete_photo_returns_the_correct_resource() {
        XCTAssertResource(resource: Collection.deletePhoto(with: "333",
                                                        from: "444"),
                          path: "/collections/444/remove",
                          method: "DELETE",
                          parameters: [
                            "photo_id": "333"])
    }
}
