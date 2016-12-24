import Foundation
import Unbox

/// Photo category links.
public struct PhotoCategoryLinks: Unboxable {
    
    // MARK: - Properties
    
    /// Category API url.
    public let this: String
    
    /// Category photos API url.
    public let photos: String
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.photos = try unboxer.unbox(key: "photos")
    }

}
