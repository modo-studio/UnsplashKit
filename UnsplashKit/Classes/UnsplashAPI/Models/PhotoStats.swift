import Foundation
import Unbox

/// Photo stats.
public struct PhotoStats: Unboxable {

    // MARK: - Attributes

    /// Photo downloads.
    public let downloads: UInt

    /// Photo likes.
    public let likes: UInt

    /// Photo views.
    public let views: UInt
    
    /// Photo links.
    public let links: PhotoLinks

    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.downloads = try unboxer.unbox(key: "downloads")
        self.likes = try unboxer.unbox(key: "likes")
        self.views = try unboxer.unbox(key: "views")
        self.links = try unboxer.unbox(key: "links")
    }

}
