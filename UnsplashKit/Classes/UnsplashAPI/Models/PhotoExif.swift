import Foundation
import Unbox

/// Photo Exif information.
public struct PhotoExif: Unboxable {

    // MARK: - Attributes

    public let make: String?
    public let model: String?
    public let exposureTime: String?
    public let aperture: String?
    public let focalLength: String?
    public let iso: Int?

    // MARK: - Unboxable

    /// Initialize an instance of this model by unboxing a dictionary using an Unboxer
    public init(unboxer: Unboxer) throws {
        self.make = unboxer.unbox(key: "make")
        self.model = unboxer.unbox(key: "model")
        self.exposureTime = unboxer.unbox(key: "exposure_time")
        self.aperture = unboxer.unbox(key: "aperture")
        self.focalLength = unboxer.unbox(key: "focal_length")
        self.iso = unboxer.unbox(key: "iso")
    }
}
