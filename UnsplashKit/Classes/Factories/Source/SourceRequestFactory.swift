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
    
    public func category(category: SourceCategory) -> NSURLRequest {
        return self.requestBuilder.patch(path: "category/\(category)").build()
    }
    
}


