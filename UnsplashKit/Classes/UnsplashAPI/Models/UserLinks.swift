import Foundation
import Unbox

/// Unsplash Links
public struct UserLinks: Unboxable {

    // MARK: - Attributes

    /// User API link.
    public let this: String
    
    /// User HTML page link.
    public let html: String
    
    /// User photos API link.
    public let photos: String
    
    /// User likes API link.
    public let likes: String
    
    /// User portfolio API link.
    public let portfolio: String
    
    /// User followers API link.
    public let followers: String?
    
    /// User following API link.
    public let following: String?

    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.html = try unboxer.unbox(key: "html")
        self.photos = try unboxer.unbox(key: "photos")
        self.likes = try unboxer.unbox(key: "likes")
        self.portfolio = try unboxer.unbox(key: "portfolio")
        self.followers = try? unboxer.unbox(key: "followers")
        self.following = try? unboxer.unbox(key: "following")
    }

}
