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
    
    internal func category(category: SourceCategory) -> NSURLRequest {
        return self.requestBuilder.patch(path: "category/\(category.description)").build()
    }

    internal func user(username: String) -> NSURLRequest {
        return self.requestBuilder.patch(path: "user/\(username)").build()
    }

    internal func usersLikes(username: String) -> NSURLRequest {
        return self.requestBuilder.patch(path: "user/\(username)/likes").build()
    }

    internal func collection(collectionID: String) -> NSURLRequest {
        return self.requestBuilder.patch(path: "collection/\(collectionID)").build()
    }

    internal func photo(photoID: [String]) -> NSURLRequest {
        return self.requestBuilder.patch(path: "/\(photoID)").build()
    }

    
    //TODO: Fixed daily/weekly photo
    //TODO: Random search term
    
}
