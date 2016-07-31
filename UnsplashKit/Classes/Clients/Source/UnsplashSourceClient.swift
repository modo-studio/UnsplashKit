import Foundation
import RxSwift
import SwiftyJSON
import Core

public class UnsplashSourceClient: HttpClient<UIImage> {
    
    // MARK: - Attributes
    
    internal let requestFactory: SourceRequestFactory
    
    // MARK: - Init
    
    public init(requestFactory: SourceRequestFactory = SourceRequestFactory.instance) {
        self.requestFactory = requestFactory
        super.init(responseAdapter: UrlDataResponseAdapter.instance)
    }
    
}
