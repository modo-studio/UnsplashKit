import Foundation
import Unbox

/// Photo
public struct Photo: Unboxable {

    // MARK: - Attributes
    
    public let id: String

    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.id = try unboxer.unbox(key: "id")
    }

    // MARK: - Resources

}
