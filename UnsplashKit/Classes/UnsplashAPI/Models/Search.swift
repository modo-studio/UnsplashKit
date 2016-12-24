import Foundation

/// Resources
public struct Search {

    public static func photos(query: String,
                              page: Int = 1,
                              perPage: Int = 10) -> Resource<[Photo]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/photos"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }

    public static func collections(query: String,
                                   page: Int = 1,
                                   perPage: Int = 10) -> Resource<[Collection]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/collections"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }

    public static func users(query: String,
                             page: Int = 1,
                             perPage: Int = 10) -> Resource<[User]> {
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "query", value: query))
        queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        queryItems.append(URLQueryItem(name: "per_page", value: "\(perPage)"))
        return Resource { (components: URLComponents) -> URLRequest in
            var mutable: URLComponents = components
            mutable.path = "/search/users"
            mutable.queryItems = queryItems
            var request = URLRequest(url: mutable.url!)
            request.httpMethod = "GET"
            return request
        }
    }

}
