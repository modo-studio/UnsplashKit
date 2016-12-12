import Foundation
import Unbox

/// Unsplash User
public struct User: Unboxable {
    
    // MARK: - Attributes
    
    public let id: String
    public let username: String
    public let firstName: String
    public let lastName: String
    public let portfolioUrl: String
    public let bio: String?
    public let location: String?
    public let totalLikes: Int
    public let totalPhotos: Int
    public let totalCollections: Int
    public let followedByUser: Bool
    public let downloads: Int
    public let uploadsRemaining: Int
    public let instagramUsername: String?
    public let email: String
    public let links: Links
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.username = try unboxer.unbox(key: "username")
        self.firstName = try unboxer.unbox(key: "first_name")
        self.lastName = try unboxer.unbox(key: "last_name")
        self.portfolioUrl = try unboxer.unbox(key: "portfolio_url")
        self.bio = unboxer.unbox(key: "bio")
        self.location = unboxer.unbox(key: "location")
        self.totalLikes = try unboxer.unbox(key: "total_likes")
        self.totalPhotos = try unboxer.unbox(key: "total_photos")
        self.totalCollections = try unboxer.unbox(key: "total_collections")
        self.followedByUser = try unboxer.unbox(key: "followed_by_user")
        self.downloads = try unboxer.unbox(key: "downloads")
        self.uploadsRemaining = try unboxer.unbox(key: "uploads_remaining")
        self.instagramUsername = unboxer.unbox(key: "instagram_username")
        self.email = try unboxer.unbox(key: "email")
        self.links = try unboxer.unbox(key: "links")
    }
    
}


// MARK: - Resources

public extension User {
    
    public static var me: Resource<User> = Resource { (components: URLComponents) -> URLRequest in
        var mutable: URLComponents = components
        mutable.path = "/me"
        return URLRequest(url: mutable.url!)
    }
    
    public static func updateMe(username: String? = nil,
                                firstName: String? = nil,
                                lastName: String? = nil,
                                email: String? = nil,
                                url: String? = nil,
                                location: String? = nil,
                                bio: String? = nil,
                                instagramUsername: String? = nil) {
        
    }
}
