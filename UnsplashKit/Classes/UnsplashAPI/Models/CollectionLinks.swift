import Foundation
import Unbox

// MARK: - Collection links.
public struct CollectionLinks: Unboxable {
    
    /// Collection API link.
    public let this: String
    
    /// Collection HTML link.
    public let html: String
    
    /// Collection photos API link.
    public let photos: String
    
    /// Related collections API link.
    public let related: String
    
    // MARK: - Init
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.html = try unboxer.unbox(key: "photos")
        self.photos = try unboxer.unbox(key: "photos")
        self.related = try unboxer.unbox(key: "related")
    }
    
}
