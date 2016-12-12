import Foundation
import Result
import Unbox
import HTTPStatusCodes

/// Unsplash Error
///
/// - urlSession: error returned form the URLSession.
/// - noData: no response data.
/// - parse: error parsing the response.
/// - clientError: HTTP client error.
/// - serverError: HTTP server error.
public enum UnsplashError: Error, CustomStringConvertible {

    case urlSession(NSError)
    case noData
    case parse(NSError)
    case clientError(HTTPStatusCode, [String])
    case serverError(HTTPStatusCode, [String])

    public var description: String {
        switch self {
        case .urlSession(let error):
            return "There was an error executing the request: \(error)"
        case .noData:
            return "Couldn't get data from the API"
        case .parse(let error):
            return "Error parsing the response: \(error)"
        case .clientError(let statusCode, let errors):
            return "Client error \(statusCode). Errors: \(errors)"
        case .serverError(let statusCode, let errors):
            return "Server error \(statusCode). Errors: \(errors)"
        }
    }

}

public final class UnsplashClient {

    // MARK: - Constants

    fileprivate struct Constants {
        static var location: String = "https://api.unsplash.com/"
    }

    // MARK: - Attributes

    /// API location.
    private let location: URL

    /// URL session.
    private let session: URLSession

    /// Extra headers to be added in every request.
    private let headers: (URLRequest) -> [String: String]

    // MARK: - Init

    /// Initializes the Unsplash Client.
    public init(location: URL = URL(string: UnsplashClient.Constants.location)!,
                session: URLSession = URLSession.shared,
                headers: @escaping (URLRequest) -> [String: String] = { _ in return [:] }) {
        self.location = location
        self.session = session
        self.headers = headers
    }

    /// Executes the resource agains the API.
    ///
    /// - Parameters:
    ///   - resource: resource to be executed.
    ///   - completion: completion closure.
    public func execute<A>(resource: Resource<A>,
                        completion: @escaping (Result<Response<A>, UnsplashError>) -> ()) {
        let components: URLComponents = URLComponents(url: self.location,
                                                      resolvingAgainstBaseURL: true)!
        var request = resource.request(components)
        if request.allHTTPHeaderFields == nil {
            request.allHTTPHeaderFields = [:]
        }
        request.allHTTPHeaderFields?["Accept-Version"] = "v1"
        request.allHTTPHeaderFields?["Accept"] = "application/json"
        self.headers(request).forEach { request.allHTTPHeaderFields?[$0.key] = $0.value }
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.urlSession(error as NSError)))
            } else if let response = response, let data = data {
                if let response = response as? HTTPURLResponse, let code = HTTPStatusCode(HTTPResponse: response) {
                    if code.isClientError || code.isServerError {
                        var errors: [String] = []
                        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
                            let dictionary = json as? [String: Any],
                            let _errors = dictionary["errors"] as? [String] {
                            errors = _errors
                        }
                        if code.isClientError {
                            completion(.failure(.clientError(code, errors)))
                        } else if code.isServerError {
                            completion(.failure(.serverError(code, errors)))
                        }
                        return
                    }
                }
                do {
                    let parsed = try resource.parse(data, response as! HTTPURLResponse)
                    let response = Response(object: parsed, response: response as! HTTPURLResponse)
                    completion(.success(response))
                } catch {
                    completion(.failure(.parse(error as NSError)))
                }
            } else {
                completion(.failure(.noData))
            }
            }.resume()
    }
}

// MARK: - Extension (HeadersProvider)

public extension UnsplashClient {

    convenience public init(location: URL = URL(string: UnsplashClient.Constants.location)!,
                            session: URLSession = URLSession.shared,
                            headersProvider: HeadersProvider) {
        self.init(location: location, session: session, headers: headersProvider.headers)
    }

}
