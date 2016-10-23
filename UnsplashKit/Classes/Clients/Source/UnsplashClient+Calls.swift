import Foundation
import RxSwift

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

extension UnsplashClient {

    public func randomPhoto(_ size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.random(size, filter: filter)).map { $0.0 }
    }

    public func randomPhoto(fromSearch terms: [String], size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.search(terms, size: size, filter: filter)).map { $0.0 }
    }

    public func randomPhoto(fromCategory category: SourceCategory, size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.category(category, size: size, filter: filter)).map { $0.0 }
    }

    public func randomPhoto(fromUser userID: String, size: CGSize? = nil, filter: SourceRequestFilter? = .none) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.user(userID, size: size, filter: filter)).map { $0.0 }
    }

    public func randomPhoto(fromUserLikes userID: String, size: CGSize? = nil) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.userLikes(userID, size: size)).map { $0.0 }
    }

    public func randomPhoto(fromCollection collectionID: String, size: CGSize? = nil) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.collection(collectionID, size: size)).map { $0.0 }
    }

    public func photo(_ identifier: String, size: CGSize? = nil) -> Observable<UnsplashImage> {
        return self.request(request: self.requestFactory.photo(identifier, size: size)).map { $0.0 }
    }
}
