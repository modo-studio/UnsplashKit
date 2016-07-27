import Foundation
import RxSwift
import SwiftyJSON
import Core

public class UnsplashSourceHttpClient: HttpClient<NSData> {
    
    // MARK: - Singleton
    
    public static var instance: UnsplashSourceHttpClient = UnsplashSourceHttpClient()
    
    
    // MARK: - Init
    
    public init(requestDispatcher: UrlRequestDispatcher = UrlRequestDispatcher(), sessionAdapter: Adapter<NSURLRequest, NSURLRequest>? = nil) {
        super.init(responseAdapter: UrlDataResponseAdapter.instance, requestDispatcher: requestDispatcher, sessionAdapter: sessionAdapter)
    }
    
}
