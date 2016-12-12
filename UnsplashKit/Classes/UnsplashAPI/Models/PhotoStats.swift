import Foundation
import Unbox

public struct PhotoStats: Unboxable {

    // MARK: - Attributes

    public let downloads: Double
    public let likes: Double
    public let views: Double
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
