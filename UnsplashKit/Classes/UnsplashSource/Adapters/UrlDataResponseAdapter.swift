import Foundation
import CarambaKit
import Result

open class UrlDataResponseAdapter: Adapter<Result<(Data, URLResponse), NSError>, Result<(UnsplashImage, URLResponse), NSError>> {

    // MARK: - Singleton

    public static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()

    // MARK: - Public

    open override func adapt(_ input: Result<(Data, URLResponse), NSError>) -> Result<(UnsplashImage, URLResponse), NSError> {
        switch input {
        case .success(let data):
            guard let image = UnsplashImage(data: data.0) else { return Result(value: (UnsplashImage(), data.1)) }
            return Result(value: (image, data.1))
        case .failure(let error):
            return Result(error: error)
        }
    }
}
