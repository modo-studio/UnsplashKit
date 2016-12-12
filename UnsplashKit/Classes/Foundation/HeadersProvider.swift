import Foundation

/// The object that conforms the protocol
/// provides the client with headers for a given request.
public protocol HeadersProvider {

    /// Returns the headers that have to be used for the given request.
    ///
    /// - Parameter request: request whose headers will be returned.
    /// - Returns: headers.
    func headers(for request: URLRequest) -> [String: String]
}
