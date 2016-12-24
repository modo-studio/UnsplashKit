import Foundation
import Unbox

// Used from user/:username/collections
public struct Collection: Unboxable {
    
    // MARK: - Properties
    
    /// Collection identifier.
    public let id: Int
    
    /// Collection title.
    public let title: String
    
    /// Collection description.
    public let description: String?
    
    /// Collection published at.
    public let publishedAt: Date
    
    /// Collection curated.
    public let curated: Bool
    
    /// Collection featured.
    public let featured: Bool
    
    /// Collection total photos.
    public let totalPhotos: UInt
    
    /// Collection privateness.
    public let isPrivate: Bool
    
    /// Collection cover photo.
    public let coverPhoto: Photo?
    
    /// Collection user
    public let user: User?
    
    /// Collection links.
    public let links: CollectionLinks?
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.title = try unboxer.unbox(key: "title")
        self.description = unboxer.unbox(key: "description")
        self.publishedAt = try unboxer.unbox(key: "published_at", formatter: DateFormatter.unsplash)
        self.curated = try unboxer.unbox(key: "curated")
        self.featured = try unboxer.unbox(key: "featured")
        self.totalPhotos = try unboxer.unbox(key: "total_photos")
        self.isPrivate = try unboxer.unbox(key: "private")
        self.coverPhoto = unboxer.unbox(key: "cover_photo")
        self.user = unboxer.unbox(key: "user")
        self.links = unboxer.unbox(key: "links")
    }
    
}


// MARK: - Resources

public extension Collection {
    
    public static func list(page: Int = 1,
                            perPage: Int = 10) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func featured(page: Int = 1,
                                perPage: Int = 10) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/featured"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func curated(page: Int = 1,
                               perPage: Int = 10) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/curated"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func get(id: String) -> Resource<Collection> {
        let queryItems: [URLQueryItem] = []
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(id)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func photos(id: String,
                              page: Int = 1,
                              perPage: Int = 10) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(id)/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func curatedPhotos(id: String,
                                     page: Int = 1,
                                     perPage: Int = 10) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/curated/\(id)/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func related(id: String) -> Resource<[Collection]> {
        let queryItems: [URLQueryItem] = []
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(id)/related"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }
    
    public static func create(title: String,
                              description: String? = nil,
                              isPrivate: Bool? = nil) -> Resource<Collection> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "title", value: title))
        if let description = description {
            queryItems.append(URLQueryItem(name: "description", value: description))
        }
        if let isPrivate = isPrivate {
            queryItems.append(URLQueryItem(name: "private", value: "\(isPrivate)"))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        }
    }
    
    public static func update(id: String,
                              title: String? = nil,
                              description: String? = nil,
                              isPrivate: Bool? = nil) -> Resource<Collection> {
        var queryItems: [URLQueryItem] = []
        if let title = title {
            queryItems.append(URLQueryItem(name: "title", value: title))
        }
        if let description = description {
            queryItems.append(URLQueryItem(name: "description", value: description))
        }
        if let isPrivate = isPrivate {
            queryItems.append(URLQueryItem(name: "private", value: "\(isPrivate)"))
        }
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(id)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "PUT"
            return request
        }
    }
    
    public static func delete(id: String) -> Resource<Void> {
        let queryItems: [URLQueryItem] = []
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(id)"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "DELETE"
            return request
        }, parse: { (_, _) -> Void in
            return ()
        })
    }
    
    public static func addPhoto(with id: String,
                                to collection: String) -> Resource<Void> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "photo_id", value: "\(id)"))
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(collection)/add"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "POST"
            return request
        }, parse: { (_, _) -> Void in
            return ()
        })
    }
    
    public static func deletePhoto(with id: String,
                                   from collection: String) -> Resource<Void> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "photo_id", value: "\(id)"))
        return Resource(request: { (components) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/collections/\(collection)/remove"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "DELETE"
            return request
        }, parse: { (_, _) -> Void in
            return ()
        })
    }
}
