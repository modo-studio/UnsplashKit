import Foundation
import CarambaKit
import Result

open class UrlDataResponseAdapter: Adapter<Result<Data, NSError>, Result<UnsplashImage, NSError>> {

    // MARK: - Singleton

    public static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()

    // MARK: - Public

    open override func adapt(_ input: Result<Data, NSError>) -> Result<UnsplashImage, NSError> {
        switch input {
        case .success(let data):
            guard let image = UnsplashImage(data: data) else { return Result(value: UnsplashImage()) }
            return Result(value: image)
        case .failure(let error):
            return Result(error: error)
        }
    }
}
