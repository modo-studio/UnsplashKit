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
    
    internal func category(category: SourceCategory, size: (Int, Int)? = nil) -> NSURLRequest {
        return self.patch(path: "category/\(category.description)", size: size)
    }

    internal func user(username: String, size: (Int, Int)? = nil) -> NSURLRequest {
        return self.patch(path: "user/\(username)", size: size)
    }

    internal func usersLikes(username: String, size: (Int, Int)? = nil) -> NSURLRequest {
        return self.patch(path: "user/\(username)/likes", size: size)
    }

    internal func collection(collectionID: String, size: (Int, Int)? = nil) -> NSURLRequest {
        return self.patch(path: "collection/\(collectionID)", size: size)
    }

    internal func photo(photoID: [String], size: (Int, Int)? = nil) -> NSURLRequest {
        return self.patch(path: "/\(photoID)", size: size)
    }

    private func patch(path p: String, size: (Int, Int)? = nil) -> NSURLRequest {
        var fullPath = p
        if let size = size {
            fullPath += "/\(size.0)x\(size.1)"
        }
        return self.requestBuilder.patch(path: p).build()
    }
    
    //TODO: Fixed daily/weekly photo
    //TODO: Random search term
    
}
