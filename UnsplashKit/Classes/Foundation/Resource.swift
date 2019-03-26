import Foundation
import Unbox

// MARK: - ResourceError

internal enum ResourceError: Error, CustomStringConvertible {

    case invalidData

    var description: String {
        switch self {
        case .invalidData: return "Couldn't parse the data"
        }
    }

}


/// Represents a web resource.
/// It includes information about how to create the reqeuest
/// and how to parse the repsonse.
public struct Resource<A> {

    /// Closure that returns a request from the given components.
    internal var request: (URLComponents) -> URLRequest

    /// Closure that specifies how to parse the response.
    internal var parse: (Data, HTTPURLResponse) throws -> A

    // MARK: - Init

    /// Initializes the resource with its attributes.
    ///
    /// - Parameters:
    ///   - request: request creation closure.
    ///   - parse: response parsing closure.
    internal init(request: @escaping (URLComponents) -> URLRequest,
                  parse: @escaping (Data, HTTPURLResponse) throws -> A) {
        self.request = request
        self.parse = parse
    }

    /// Initializes the resource with the request closure and a JSON parser.
    ///
    /// - Parameters:
    ///   - request: request creation closure.
    ///   - parse: json response parsing closure.
    internal init(request: @escaping (URLComponents) -> URLRequest,
                  jsonParse: @escaping (Any, HTTPURLResponse) throws -> A) {
        self.request = request
        self.parse = { data,response  -> A in
            guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                throw ResourceError.invalidData
            }
            return try jsonParse(json, response)
        }
    }

}

// MARK: - Resource Extension (Unboxable)

extension Resource where A: Unboxable {

    /// Initializes the resource with a Unboxable type.
    ///
    /// - Parameters:
    ///   - request: request creation closure.
    init(request: @escaping (URLComponents) -> URLRequest) {
        self.init(request: request, parse: { (data, response) -> A in
            return try unbox(data: data)
        })
    }

}


// MARK: - Resource Extension (Array<Unboxable>)

extension Resource where A: Sequence, A.Iterator.Element: Unboxable {

    /// Initializes the resource with a Array<Unboxable> type.
    ///
    /// - Parameter request: request creation closure.
    init(request: @escaping (URLComponents) -> URLRequest) {
        self.init(request: request, parse: { (data, response) -> A in
            let parsed: Array<A.Iterator.Element> = try unbox(data: data)
            return parsed as! A
        })
    }

}
