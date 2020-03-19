import Foundation
import Unbox

/// Photo category.
public struct PhotoCategory: Unboxable {

    // MARK: - Properties
    
    /// Category id.
    public let id: Int
    
    /// Category title.
    public let title: String
    
    /// Category links.
    public let links: PhotoCategoryLinks?
    
    // MARK: - Unboxable
    
    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
        self.title = try unboxer.unbox(key: "title")
        self.links = try? unboxer.unbox(key: "links")
    }

}
