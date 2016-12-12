import Foundation
import Unbox
import CoreLocation

/// Photo
public struct Photo: Unboxable {
    
    // MARK: - Attributes
    
    public let id: String
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
    }
    
}


// MARK: - Resources

public extension Photo {
    
    public static var photos: Resource<User> = Resource { (components: URLComponents) -> URLRequest in
        var mutable: URLComponents = components
        mutable.path = "/me"
        return URLRequest(url: mutable.url!)
    }
    
    public static func list(page: Int = 1,
                            perPage: Int = 10,
                            orderBy: Order = .latest) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        queryItems.append(URLQueryItem(name: "order_by", value: orderBy.rawValue))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func curated(page: Int = 1,
                               perPage: Int = 10,
                               orderBy: Order = .latest) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        queryItems.append(URLQueryItem(name: "order_by", value: orderBy.rawValue))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/curated"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func get(id: String,
                           size: CGSize? = nil,
                           rect: CGRect? = nil) -> Resource<Photo> {
        var queryItems: [URLQueryItem] = []
        if let size = size {
            queryItems.append(URLQueryItem(name: "w", value: "\(size.width)"))
            queryItems.append(URLQueryItem(name: "h", value: "\(size.height)"))
        }
        if let rect = rect {
            queryItems.append(URLQueryItem(name: "rect", value: "\(rect.origin.x),\(rect.origin.y),\(rect.size.width),\(rect.size.height)"))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func random(categories: [String] = [],
                              collections: [String] = [],
                              featured: Bool? = nil,
                              username: String? = nil,
                              size: CGSize? = nil,
                              orientation: Orientation? = nil) -> Resource<Photo> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "category", value: categories.joined(separator: ",")))
        queryItems.append(URLQueryItem(name: "collections", value: collections.joined(separator: ",")))
        if let featured = featured {
            queryItems.append(URLQueryItem(name: "featured", value: "\(featured)"))
        }
        if let username = username {
            queryItems.append(URLQueryItem(name: "username", value: username))
        }
        if let size = size {
            queryItems.append(URLQueryItem(name: "w", value: "\(size.width)"))
            queryItems.append(URLQueryItem(name: "h", value: "\(size.height)"))
        }
        if let orientation = orientation {
            queryItems.append(URLQueryItem(name: "orientation", value: orientation.rawValue))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/random"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func random(count: Int,
                              categories: [String] = [],
                              collections: [String] = [],
                              featured: Bool? = nil,
                              username: String? = nil,
                              size: CGSize? = nil,
                              orientation: Orientation? = nil) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "category", value: categories.joined(separator: ",")))
        queryItems.append(URLQueryItem(name: "collections", value: collections.joined(separator: ",")))
        if let featured = featured {
            queryItems.append(URLQueryItem(name: "featured", value: "\(featured)"))
        }
        if let username = username {
            queryItems.append(URLQueryItem(name: "username", value: username))
        }
        if let size = size {
            queryItems.append(URLQueryItem(name: "w", value: "\(size.width)"))
            queryItems.append(URLQueryItem(name: "h", value: "\(size.height)"))
        }
        if let orientation = orientation {
            queryItems.append(URLQueryItem(name: "orientation", value: orientation.rawValue))
        }
        queryItems.append(URLQueryItem(name: "count", value: "\(count)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/random"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func stats(id: String) -> Resource<PhotoStats> {
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/stats"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func downloadLink(id: String) -> Resource<String> {
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/download"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }, parse: { (data, _) -> String in
            return try Unboxer(data: data).unbox(key: "url")
        })
    }
    
    public static func update(id: String,
                              locationPosition: CLLocation? = nil,
                              locationName: String? = nil,
                              locationCity: String? = nil,
                              locationCountry: String? = nil,
                              locationConfidential: String? = nil,
                              exifMake: String? = nil,
                              exifModel: String? = nil,
                              exifExposureTime: String? = nil,
                              exifAperture: String? = nil,
                              exifFocalLength: String? = nil,
                              exifIsoSpeedRatings: Int? = nil) -> Resource<Photo> {
        var queryItems: [URLQueryItem] = []
        if let locationPosition = locationPosition {
            queryItems.append(URLQueryItem(name: "location[latitude]", value: "\(locationPosition.coordinate.latitude)"))
            queryItems.append(URLQueryItem(name: "location[longitude]", value: "\(locationPosition.coordinate.longitude)"))
        }
        if let locationName = locationName {
            queryItems.append(URLQueryItem(name: "location[name]", value: locationName))
        }
        if let locationCity = locationCity {
            queryItems.append(URLQueryItem(name: "location[city]", value: locationCity))
        }
        if let locationConfidential = locationConfidential {
            queryItems.append(URLQueryItem(name: "location[confidential]", value: locationConfidential))
        }
        if let locationName = locationName {
            queryItems.append(URLQueryItem(name: "location[name]", value: locationName))
        }
        if let exifMake = exifMake {
            queryItems.append(URLQueryItem(name: "exif[make]", value: exifMake))
        }
        if let exifModel = exifModel {
            queryItems.append(URLQueryItem(name: "exif[model]", value: exifModel))
        }
        if let exifExposureTime = exifExposureTime {
            queryItems.append(URLQueryItem(name: "exif[exposure_time]", value: exifExposureTime))
        }
        if let exifAperture = exifAperture {
            queryItems.append(URLQueryItem(name: "exif[aperture]", value: exifAperture))
        }
        if let exifFocalLength = exifFocalLength {
            queryItems.append(URLQueryItem(name: "exif[focal_length]", value: exifFocalLength))
        }
        if let exifIsoSpeedRatings = exifIsoSpeedRatings {
            queryItems.append(URLQueryItem(name: "exif[iso_speed_ratings]", value: "\(exifIsoSpeedRatings)"))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "PUT"
            return request
        }
    }
    
    public static func like(id: String) -> Resource<Void> {
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/like"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "post"
            return request
        }, jsonParse: { (_, _) -> Void in
            return ()
        })
    }
    
    public static func unlike(id: String) -> Resource<Void> {
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/like"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "DELETE"
            return request
        }, jsonParse: { (_, _) -> Void in
            return ()
        })
    }
}
