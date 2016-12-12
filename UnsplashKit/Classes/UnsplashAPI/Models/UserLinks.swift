import Foundation
import Unbox

/// Unsplash Links
public struct UserLinks: Unboxable {

    // MARK: - Attributes

    public let this: String
    public let html: String
    public let photos: String
    public let likes: String
    public let portfolio: String
    public let followers: String?
    public let following: String?

    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.html = try unboxer.unbox(key: "html")
        self.photos = try unboxer.unbox(key: "photos")
        self.likes = try unboxer.unbox(key: "likes")
        self.portfolio = try unboxer.unbox(key: "portfolio")
        self.followers = unboxer.unbox(key: "followers")
        self.following = unboxer.unbox(key: "following")

    }

}
