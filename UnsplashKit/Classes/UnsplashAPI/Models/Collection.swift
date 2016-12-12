import Foundation
import Unbox

// Used from user/:username/collections
public struct Collection: Unboxable {
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        //TODO
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
        var queryItems: [URLQueryItem] = []
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
        var queryItems: [URLQueryItem] = []
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
        var queryItems: [URLQueryItem] = []
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
