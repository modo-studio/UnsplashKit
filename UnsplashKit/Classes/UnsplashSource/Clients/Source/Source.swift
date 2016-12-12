import Foundation
import CarambaKit

open class UnsplashSource: HttpClient<UnsplashImage> {

    // MARK: - Attributes

    internal let requestFactory: SourceRequestFactory

    // MARK: - Init

    public init(requestFactory: SourceRequestFactory = SourceRequestFactory.instance) {
        self.requestFactory = requestFactory
        super.init(responseAdapter: UrlDataResponseAdapter.instance)
    }
}
