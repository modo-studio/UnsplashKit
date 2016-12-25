import Foundation
import XCTest
import CoreLocation

@testable import UnsplashKit

final class PhotoSpec: XCTestCase {
    
    func test_that_resource_list_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.list(page: 3,
                                               perPage: 33,
                                               orderBy: .latest),
                          path: "/photos",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33",
                            "order_by": "latest"
            ])
    }
    
    func test_that_resource_curated_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.curated(page: 3,
                                               perPage: 33,
                                               orderBy: .latest),
                          path: "/photos/curated",
                          method: "GET",
                          parameters: [
                            "page": "3",
                            "per_page": "33",
                            "order_by": "latest"
            ])
    }
    
    func test_that_resource_get_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.get(id: "333",
                                              size: CGSize(width: 20, height: 20),
                                              rect: CGRect(x: 0, y: 0, width: 20, height: 20)),
                          path: "/photos/333",
                          method: "GET",
                          parameters: [
                            "w": "20.0",
                            "h": "20.0",
                            "rect": "0.0,0.0,20.0,20.0"
            ])
    }
    
    func test_that_resource_random_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.random(categories: ["first","second"],
                                                 collections: ["first", "second"], featured: true,
                                                 username: "user",
                                                 size: CGSize(width: 20, height: 20),
                                                 orientation: .portrait),
                          path: "/photos/random",
                          method: "GET",
                          parameters: [
                            "category": "first,second",
                            "collections": "first,second",
                            "featured": "true",
                            "username": "user",
                            "w": "20.0",
                            "h": "20.0",
                            "orientation": "portrait"
            ])
    }
    
    func test_that_resource_random_with_count_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.random(count: 3,
                                                 categories: ["first","second"],
                                                 collections: ["first", "second"], featured: true,
                                                 username: "user",
                                                 size: CGSize(width: 20, height: 20),
                                                 orientation: .portrait),
                          path: "/photos/random",
                          method: "GET",
                          parameters: [
                            "count": "3",
                            "category": "first,second",
                            "collections": "first,second",
                            "featured": "true",
                            "username": "user",
                            "w": "20.0",
                            "h": "20.0",
                            "orientation": "portrait"
            ])
    }
    
    func test_that_resource_stats_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.stats(id: "333"),
                          path: "/photos/333/stats",
                          method: "GET",
                          parameters: [:])
    }
    
    func test_that_resource_download_link_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.downloadLink(id: "333"),
                          path: "/photos/333/download",
                          method: "GET",
                          parameters: [:])
    }
    
    func test_that_resource_update_returns_the_correct_resource() {
        
        XCTAssertResource(resource: Photo.update(id: "333",
                                                 locationPosition: CLLocation(latitude: 20.0, longitude: 20.0),
                                                 locationName: "home",
                                                 locationCity: "barcelona",
                                                 locationCountry: "spain",
                                                 locationConfidential: "confidential",
                                                 exifMake: "make",
                                                 exifModel: "model",
                                                 exifExposureTime: "30",
                                                 exifAperture: "50.0",
                                                 exifFocalLength: "100",
                                                 exifIsoSpeedRatings: 25),
                          path: "/photos/333",
                          method: "PUT",
                          parameters: [
                            "location[latitude]": "20.0",
                            "location[longitude]": "20.0",
                            "location[name]": "home",
                            "location[city]": "barcelona",
                            "location[confidential]": "confidential",
                            "location[country]": "spain",
                            "exif[make]": "make",
                            "exif[model]": "model",
                            "exif[exposure_time]": "30",
                            "exif[aperture]": "50.0",
                            "exif[focal_length]": "100",
                            "exif[iso_speed_ratings]": "25"])
    }
    
    func test_that_resource_like_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.like(id: "333"),
                          path: "/photos/333/like",
                          method: "POST",
                          parameters: [:])
    }
    
    func test_that_resource_unlike_returns_the_correct_resource() {
        XCTAssertResource(resource: Photo.unlike(id: "333"),
                          path: "/photos/333/like",
                          method: "DELETE",
                          parameters: [:])
    }
}
