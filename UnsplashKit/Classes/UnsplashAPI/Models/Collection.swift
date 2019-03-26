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

    /// Resource that lists the collections.
    ///
    /// - Parameters:
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    /// - Returns: resource for fetching the collections.
    static func list(page: Int = 1,
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
    
    /// Resource that returns the featured collections.
    ///
    /// - Parameters:
    ///   - page: page to be fetched.
    ///   - perPage: number of items to be fetched.
    /// - Returns: resource for fetching the featured collections.
    static func featured(page: Int = 1,
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
    
    /// Resource for fetching curated collections.
    ///
    /// - Parameters:
    ///   - page: page to be fetched.
    ///   - perPage: number of items to be fetched.
    /// - Returns: resource for fetching curated collections.
    static func curated(page: Int = 1,
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
    
    /// Resource for fetching a collection.
    ///
    /// - Parameter id: collection identifier.
    /// - Returns: resource for fetching the collection.
    static func get(id: String) -> Resource<Collection> {
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
    
    /// Resource for fetching a collection photos.
    ///
    /// - Parameters:
    ///   - id: collection id.
    ///   - page: page to be fetched.
    ///   - perPage: items per page.
    /// - Returns: resource for fetching the photos.
    static func photos(id: String,
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
    
    /// Resource for fetching the photos of a curated collection.
    ///
    /// - Parameters:
    ///   - id: collection identifier.
    ///   - page: page to be fetched.
    ///   - perPage: number of items per page.
    /// - Returns: resource for fetching the photos.
    static func curatedPhotos(id: String,
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
    
    /// Resource for fetching related collections to a given one.
    ///
    /// - Parameter id: collection identifier whose related ones will be fetched.
    /// - Returns: resource for fetching the related collections.
    static func related(id: String) -> Resource<[Collection]> {
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
    
    /// Resource for creating a collection.
    ///
    /// - Parameters:
    ///   - title: collection title.
    ///   - description: collection title.
    ///   - isPrivate: collection private value.
    /// - Returns: resource for creating the collection.
    static func create(title: String,
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
    
    /// Resource for updating a collection.
    ///
    /// - Parameters:
    ///   - id: collection identifier.
    ///   - title: new title.
    ///   - description: new description.
    ///   - isPrivate: new private value.
    /// - Returns: resource for updating theh collection.
    static func update(id: String,
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
    
    /// Resource for deleting the collection.
    ///
    /// - Parameter id: collection identifier.
    /// - Returns: resource for deleting the collection.
    static func delete(id: String) -> Resource<Void> {
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
    
    /// Resource for adding a photo to a collection.
    ///
    /// - Parameters:
    ///   - id: photo identifier.
    ///   - collection: collection identifier.
    /// - Returns: resource for adding the photo.
    static func addPhoto(with id: String,
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
    
    /// Resource for deleting a photo from a collection.
    ///
    /// - Parameters:
    ///   - id: photo identifier.
    ///   - collection: collection identifier.
    /// - Returns: resource for deleting the photo.
    static func deletePhoto(with id: String,
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
