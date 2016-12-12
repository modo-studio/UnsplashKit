import Foundation
import Unbox

/// Unsplash Links
public struct PhotoLinks: Unboxable {
    
    // MARK: - Attributes
    
    public let this: String
    public let html: String
    public let download: String

    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.html = try unboxer.unbox(key: "html")
        self.download = try unboxer.unbox(key: "download")
    }
    
}
