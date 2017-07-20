import Foundation
import CarambaKit
import CoreGraphics

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

open class SourceRequestFactory {
    
    // MARK: - Singleton
    
    open static var instance: SourceRequestFactory = SourceRequestFactory()
    
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
    
    internal func random(_ size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> URLRequest {
        return self.get(path: "random", size: size, filter: filter)
    }
    
    internal func search(_ terms: [String], size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> URLRequest {
        return self.get(path: "featured", size: size, filter: filter, search: terms)
    }
    
    internal func category(_ category: SourceCategory, size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> URLRequest {
        return self.get(path: "category/\(category.rawValue)", size: size, filter: filter)
    }
    
    internal func user(_ username: String, size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> URLRequest {
        return self.get(path: "user/\(username)", size: size, filter: filter)
    }
    
    internal func userLikes(_ username: String, size: CGSize? = nil) -> URLRequest {
        return self.get(path: "user/\(username)/likes", size: size)
    }
    
    internal func collection(_ collectionID: String, size: CGSize? = nil) -> URLRequest {
        return self.get(path: "collection/\(collectionID)", size: size)
    }
    
    internal func photo(_ photoID: String, size: CGSize? = nil) -> URLRequest {
        return self.get(path: "/\(photoID)", size: size)
    }
    
    fileprivate func get(path: String,
                         size: CGSize? = nil,
                         filter: SourceRequestFilter? = .none,
                         search: [String]? = nil) -> URLRequest {
        var fullPath = path
        
        if let size = size {
            fullPath += "/\(Int(size.width))x\(Int(size.height))"
        }
        
        if let filter = filter {
            fullPath += "/\(filter.rawValue)"
        }
        
        let request = self.requestBuilder.get(fullPath)
        
        if let terms = search {
            let requestWithParameters = request.with(parameters: ["search" : terms.joined(separator: ",") as AnyObject])
            return requestWithParameters.build() as URLRequest
        } else {
            return request.build() as URLRequest
        }
    }
}

extension SourceRequestFactory {
    func searchParameterEncoding(_ request: NSURLRequest, params: [String: AnyObject]?) -> (NSMutableURLRequest, NSError?) {
        let r = request as! NSMutableURLRequest
        if let params = params {
            if let searchTerms = params["search"] as? String {
                r.url = URL(string: "\(request.url!.absoluteString)?\(searchTerms)")
            }
        }
        return (request as! NSMutableURLRequest, nil)
    }
}
