import Foundation
import Unbox
import CoreLocation
import CoreGraphics

/// Photo
public struct Photo: Unboxable {
    
    // MARK: - Attributes
    
    /// Photo identifier
    public let id: String
    
    /// Photo created at date.
    public let createdAt: Date
    
    /// Photo width.
    public let width: CGFloat
    
    /// Photo height.
    public let height: CGFloat
    
    /// Photo color.
    public let color: String
    
    /// Photo likes.
    public let likes: UInt
    
    /// Photo URLs.
    public let urls: PhotoUrls?
    
    /// Photo categories.
    public let categories: [PhotoCategory]?
    
    /// Photo links
    public let links: PhotoLinks?
    
    /// Photo user
    public let user: User?
    
    /// Photo current user collections.
    public let currentUserCollections: [Collection]?
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.createdAt = try unboxer.unbox(key: "created_at", formatter: DateFormatter.unsplash)
        self.width = try unboxer.unbox(key: "width")
        self.height = try unboxer.unbox(key: "height")
        self.color = try unboxer.unbox(key: "color")
        self.likes = try unboxer.unbox(key: "likes")
        self.urls = unboxer.unbox(key: "urls")
        self.links = unboxer.unbox(key: "links")
        self.categories = unboxer.unbox(key: "categories")
        self.user = unboxer.unbox(key: "user")
        self.currentUserCollections = unboxer.unbox(key: "current_user_collections")
    }
    
}


// MARK: - Resources

public extension Photo {
    
    /// Resource for fetching photos.
    ///
    /// - Parameters:
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    ///   - orderBy: order by value.
    /// - Returns: resource for fetching photos.
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
    
    /// Resource for fetching curated photos.
    ///
    /// - Parameters:
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    ///   - orderBy: order by value.
    /// - Returns: resource for fetching the curated photos.
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
    
    /// Resource for fetching a photo with a given id.
    ///
    /// - Parameters:
    ///   - id: photo identifier.
    ///   - size: photo size.
    ///   - rect: photo rect.
    /// - Returns: resource for fetching a photo.
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
    
    
    /// Resource for fetching a random photo.
    ///
    /// - Parameters:
    ///   - categories: categories used for filtering.
    ///   - collections: collections used for filtering.
    ///   - featured: featured used for filtering.
    ///   - username: username used for filtering.
    ///   - size: size of the photos.
    ///   - orientation: orientation filtering.
    /// - Returns: resource for fetching the photos.
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
    
    /// Resource for fetching random photos.
    ///
    /// - Parameters:
    ///   - count: number of photos to be fetched.
    ///   - categories: categories used for filtering.
    ///   - collections: collections used for filtering.
    ///   - featured: featured used for filtering.
    ///   - username: username used for filtering.
    ///   - size: size of the photos.
    ///   - orientation: orientation used for filtering.
    /// - Returns: resource for fetching the photos.
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
    
    /// Resource for fetching a photo stats.
    ///
    /// - Parameter id: photo identifier.
    /// - Returns: resource for fetching the stats.
    public static func stats(id: String) -> Resource<PhotoStats> {
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/stats"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    /// Resource for fetching a photo download link.
    ///
    /// - Parameter id: photo identifier.
    /// - Returns: resource for fetching the photo download link.
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
    
    /// Resource for updating a photo.
    ///
    /// - Parameters:
    ///   - id: photo identifier.
    ///   - locationPosition: photo new location position.
    ///   - locationName: photo new location ma.e
    ///   - locationCity: photo new location city.
    ///   - locationCountry: photo new country.
    ///   - locationConfidential: photo new confidential.
    ///   - exifMake: photo new exif make.
    ///   - exifModel: photo new exif model.
    ///   - exifExposureTime: photo new exif exposure time.
    ///   - exifAperture: photo new exif aperture.
    ///   - exifFocalLength: photo new exif focal length.
    ///   - exifIsoSpeedRatings: photo new exif iso speed ratings.
    /// - Returns: resource for updating the photo.
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
        if let locationCountry = locationCountry {
            queryItems.append(URLQueryItem(name: "location[country]", value: locationCountry))
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
    
    /// Resource for liking a photo.
    ///
    /// - Parameter id: photo to be liked.
    /// - Returns: resource for liking the photo.
    public static func like(id: String) -> Resource<Void> {
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/photos/\(id)/like"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        }, jsonParse: { (_, _) -> Void in
            return ()
        })
    }
    
    /// Resource for unliking a photo
    ///
    /// - Parameter id: photo to be unliked.
    /// - Returns: resource for unliking the photo.
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
