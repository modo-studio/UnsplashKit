import Foundation
import Unbox

/// Unsplash Links
public struct PhotoLinks: Unboxable {

    // MARK: - Attributes

    /// Photo API link.
    public let this: String

    /// Photo HTML link.
    public let html: String

    /// Photo download HTML link.
    public let download: String
    
    /// Photo download API link.
    public let downloadLocation: String
    
    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.this = try unboxer.unbox(key: "self")
        self.html = try unboxer.unbox(key: "html")
        self.download = try unboxer.unbox(key: "download")
        self.downloadLocation = try unboxer.unbox(key: "download_location")
    }

}
