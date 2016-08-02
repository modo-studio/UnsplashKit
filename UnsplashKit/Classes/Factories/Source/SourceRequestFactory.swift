import Foundation
import Core

public class SourceRequestFactory {
    
    // MARK: - Singleton
    
    public static var instance: SourceRequestFactory = SourceRequestFactory()
    
    
    // MARK: - Attributes
    
    let requestBuilder: UrlRequestBuilder
    
    
    // MARK: - Init
    
    internal init(requestBuilder: UrlRequestBuilder) {
        self.requestBuilder = requestBuilder
    }
    
    public convenience init() {
        self.init(requestBuilder: UrlRequestBuilder(baseUrl: "https://source.unsplash.com"))
    }
    
    
    // MARK: - Public

    internal func random(size: CGSize? = nil, filter: SourceRequestFilter? = .None) -> NSURLRequest {
        return self.get(path: "random", size: size, filter: filter)
    }
    
    internal func search(terms: [String], size: CGSize? = nil, filter: SourceRequestFilter? = .None) -> NSURLRequest {
        return self.get(path: "", size: size, filter: filter, search: terms)
    }

    internal func category(category: SourceCategory, size: CGSize? = nil, filter: SourceRequestFilter? = .None) -> NSURLRequest {
        return self.get(path: "category/\(category.description)", size: size, filter: filter)
    }

    internal func user(username: String, size: CGSize? = nil, filter: SourceRequestFilter? = .None) -> NSURLRequest {
        return self.get(path: "user/\(username)", size: size, filter: filter)
    }

    internal func userLikes(username: String, size: CGSize? = nil) -> NSURLRequest {
        return self.get(path: "user/\(username)/likes", size: size)
    }

    internal func collection(collectionID: String, size: CGSize? = nil) -> NSURLRequest {
        return self.get(path: "collection/\(collectionID)", size: size)
    }

    internal func photo(photoID: String, size: CGSize? = nil) -> NSURLRequest {
        return self.get(path: "/\(photoID)", size: size)
    }
    
    private func get(path p: String,
                            size: CGSize? = nil,
                            filter: SourceRequestFilter? = .None,
                            search: [String]? = nil) -> NSURLRequest {
        var fullPath = p

        if let size = size {
            fullPath += "/\(size.width)x\(size.height)"
        }
        
        if let filter = filter {
            fullPath += "/\(filter.description)"
        }
        
        if let terms = search {
            fullPath += "/?\(terms.joinWithSeparator(","))"
        }
        
        return self.requestBuilder.get(path: p).build()
    }
    
    //TODO: Fixed daily/weekly photo
    //TODO: Random search term
    
}
