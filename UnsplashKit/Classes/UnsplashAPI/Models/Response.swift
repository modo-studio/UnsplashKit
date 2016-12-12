import Foundation

/// API response that includes the pagination links.
public struct Response<A> {
    
    // MARK: - Attributes
    
    /// Response object.
    public let object: A
    
    /// Pagination first link.
    public let firstLink: Link?
    
    /// Pagination previous link.
    public let prevLink: Link?
    
    /// Pagination next link.
    public let nextLink: Link?
    
    /// Pagination last link.
    public let lastLink: Link?
    
    /// Limit of requests.
    public let limitRequests: Int?
    
    /// Number of remaining requests.
    public let remainingRequests: Int?

    // MARK: - Init
    
    /// Initializes the response with the object and the http response.
    ///
    /// - Parameters:
    ///   - object: object included in the response.
    ///   - response: http url response.
    internal init(object: A, response: HTTPURLResponse) {
        self.object = object
        self.firstLink = response.findLink(relation: "first")
        self.prevLink = response.findLink(relation: "prev")
        self.nextLink = response.findLink(relation: "next")
        self.lastLink = response.findLink(relation: "last")
        self.limitRequests =  response.allHeaderFields["X-Ratelimit-Limit"] as? Int
        self.remainingRequests =  response.allHeaderFields["X-Ratelimit-Remaining"] as? Int
    }
    
}
