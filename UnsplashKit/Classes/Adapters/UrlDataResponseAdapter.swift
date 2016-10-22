import Foundation
import CarambaKit

open class UrlDataResponseAdapter: Adapter<(data: Data?, response: URLResponse?), (UnsplashImage, URLResponse?)> {

    // MARK: - Singleton

    open static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()

    // MARK: - Public

    open override func adapt(_ input: (data: Data?, response: URLResponse?)) -> (UnsplashImage, URLResponse?)! {
        guard let data = input.data else { return (UnsplashImage(), input.response) }
        guard let image = UnsplashImage(data: data) else { return (UnsplashImage(), input.response) }
        return (image, input.response)
    }
}
