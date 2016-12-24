import Foundation
import Unbox

/// Photo URLs
public struct PhotoUrls: Unboxable {

    // MARK: - Properties
    
    /// Photo raw URL.
    public let raw: String
    
    /// Photo full URL.
    public let full: String
    
    /// Photo regular URL.
    public let regular: String
    
    /// Photo small URL.
    public let small: String
    
    /// Photo thumb URL.
    public let thumb: String
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.raw = try unboxer.unbox(key: "raw")
        self.full = try unboxer.unbox(key: "full")
        self.regular = try unboxer.unbox(key: "regular")
        self.small = try unboxer.unbox(key: "small")
        self.thumb = try unboxer.unbox(key: "thumb")
    }

}
