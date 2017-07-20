import Foundation
import CarambaKit
import Result

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

public typealias ImageCompletion = (Result<(UnsplashImage, URLResponse), NSError>) -> Void

extension UnsplashSource {

    public func randomPhoto(_ size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.random(size, filter: filter), completion: completion)
    }

    public func randomPhoto(fromSearch terms: [String], size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.search(terms, size: size, filter: filter), completion: completion)
    }

    public func randomPhoto(fromCategory category: SourceCategory, size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.category(category, size: size, filter: filter), completion: completion)
    }

    public func randomPhoto(fromUser userID: String, size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.user(userID, size: size, filter: filter), completion: completion)
    }

    public func randomPhoto(fromUserLikes userID: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.userLikes(userID, size: size), completion: completion)
    }

    public func randomPhoto(fromCollection collectionID: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.collection(collectionID, size: size), completion: completion)
    }

    public func photo(_ identifier: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        self.request(request: self.requestFactory.photo(identifier, size: size), completion: completion)
    }
}
