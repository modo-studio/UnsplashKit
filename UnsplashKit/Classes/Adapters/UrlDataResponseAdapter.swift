import Foundation
import CarambaKit

public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (UnsplashImage?, NSURLResponse?)> {

    // MARK: - Singleton

    public static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()

    // MARK: - Public

    public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (UnsplashImage?, NSURLResponse?)! {
        guard let data = input.data else { return (nil, input.response) }
        guard let image = UnsplashImage(data: data) else { return (nil, input.response) }
        return (image, input.response)
    }
}
