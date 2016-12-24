import Foundation
import Unbox

/// Unsplash User
public struct User: Unboxable {
    
    // MARK: - Attributes
    
    /// User identifier.
    public let id: String
    
    /// User username.
    public let username: String
    
    /// User first name.
    public let firstName: String
    
    /// User last name.
    public let lastName: String
    
    /// User portfolio url.
    public let portfolioUrl: String
    
    /// User biography.
    public let bio: String?
    
    /// User location.
    public let location: String?
    
    /// User total likes.
    public let totalLikes: Int
    
    /// User total photos.
    public let totalPhotos: Int
    
    /// User total collections.
    public let totalCollections: Int
    
    /// User followed by user. It's true if the authenticated user is following the user.
    public let followedByUser: Bool
    
    /// Number of downloads.
    public let downloads: Int
    
    /// Number of uploads remaining.
    public let uploadsRemaining: Int?
    
    /// Instagram username.
    public let instagramUsername: String?
    
    /// Email address.
    public let email: String?
    
    /// User links.
    public let links: UserLinks?
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.username = try unboxer.unbox(key: "username")
        self.firstName = try unboxer.unbox(key: "first_name")
        self.lastName = try unboxer.unbox(key: "last_name")
        self.portfolioUrl = try unboxer.unbox(key: "portfolio_url")
        self.bio = unboxer.unbox(key: "bio")
        self.location = unboxer.unbox(key: "location")
        self.totalLikes = try unboxer.unbox(key: "total_likes")
        self.totalPhotos = try unboxer.unbox(key: "total_photos")
        self.totalCollections = try unboxer.unbox(key: "total_collections")
        self.followedByUser = try unboxer.unbox(key: "followed_by_user")
        self.downloads = try unboxer.unbox(key: "downloads")
        self.uploadsRemaining = unboxer.unbox(key: "uploads_remaining")
        self.instagramUsername = unboxer.unbox(key: "instagram_username")
        self.email = unboxer.unbox(key: "email")
        self.links = unboxer.unbox(key: "links")
    }
}


// MARK: - Resources

public extension User {
    
    
    /// Returns the resource to fetch the authenticated user.
    public static var me: Resource<User> = Resource { (components: URLComponents) -> URLRequest in
        var mutable: URLComponents = components
        mutable.path = "/me"
        return URLRequest(url: mutable.url!)
    }
    
    public static func updateMe(username: String? = nil,
                                firstName: String? = nil,
                                lastName: String? = nil,
                                email: String? = nil,
                                url: String? = nil,
                                location: String? = nil,
                                bio: String? = nil,
                                instagramUsername: String? = nil) ->  Resource<User> {
        var queryItems: [URLQueryItem] = []
        if let username = username { queryItems.append(URLQueryItem(name: "username", value: username)) }
        if let firstName = firstName { queryItems.append(URLQueryItem(name: "first_name", value: firstName)) }
        if let lastName = lastName { queryItems.append(URLQueryItem(name: "last_name", value: lastName)) }
        if let email = email { queryItems.append(URLQueryItem(name: "email", value: email)) }
        if let url = url { queryItems.append(URLQueryItem(name: "url", value: url)) }
        if let location = location { queryItems.append(URLQueryItem(name: "location", value: location)) }
        if let bio = bio { queryItems.append(URLQueryItem(name: "bio", value: bio)) }
        if let instagramUsername = instagramUsername { queryItems.append(URLQueryItem(name: "instagram_username", value: instagramUsername)) }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/me"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "PUT"
            return request
        }
    }
    
    public static func get(username: String,
                           size: CGSize? = nil) -> Resource<User> {
        var queryItems: [URLQueryItem] = []
        if let size = size {
            queryItems.append(URLQueryItem(name: "w", value: "\(size.width)"))
            queryItems.append(URLQueryItem(name: "h", value: "\(size.height)"))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/users/\(username)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func portfolio(username: String) -> Resource<String> {
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/users/\(username)/portfolio"
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }, parse: { (data, _) -> String in
            return try Unboxer(data: data).unbox(key: "url")
        })
    }
    
    public static func photos(username: String,
                              page: Int = 1,
                              perPage: Int = 10,
                              orderBy: Order = .latest) -> Resource<[ShortPhoto]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        queryItems.append(URLQueryItem(name: "order_by", value: orderBy.rawValue))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/users/\(username)/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func likes(username: String,
                             page: Int = 1,
                             perPage: Int = 10,
                             orderBy: Order = .latest) -> Resource<[ShortPhoto]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        queryItems.append(URLQueryItem(name: "order_by", value: orderBy.rawValue))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/users/\(username)/likes"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func collections(username: String,
                                   page: Int = 1,
                                   perPage: Int = 10,
                                   orderBy: Order = .latest) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        queryItems.append(URLQueryItem(name: "order_by", value: orderBy.rawValue))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/users/\(username)/collections"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
}
