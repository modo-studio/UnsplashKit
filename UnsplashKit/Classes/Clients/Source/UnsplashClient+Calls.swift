import Foundation
import RxSwift

#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

extension UnsplashClient {

    public typealias ImageCompletion = (_ image: UnsplashImage) -> Void

    public func randomPhoto(_ size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(size, filter: filter), forCompletion: completion)
    }

    public func randomPhoto(fromSearch terms: [String], size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(fromSearch: terms, size: size, filter: filter), forCompletion: completion)
    }

    public func randomPhoto(fromCategory category: SourceCategory, size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(fromCategory: category, size: size, filter: filter), forCompletion: completion)
    }

    public func randomPhoto(fromUser userID: String, size: CGSize? = nil, filter: SourceRequestFilter? = .none, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(fromUser: userID, size: size, filter: filter), forCompletion: completion)
    }

    public func randomPhoto(fromUserLikes userID: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(fromUserLikes: userID, size: size), forCompletion: completion)
    }

    public func randomPhoto(fromCollection collectionID: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        process(observable: randomPhoto(fromCollection: collectionID, size: size), forCompletion: completion)
    }

    public func photo(_ identifier: String, size: CGSize? = nil, completion: @escaping ImageCompletion) {
        process(observable: photo(identifier, size: size), forCompletion: completion)
    }

    private func process(observable: Observable<UnsplashImage>, forCompletion completion: @escaping ImageCompletion) {
        observable.subscribe(onNext: { image in
            completion(image)
        })
    }
}
