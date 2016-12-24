import Foundation
import Unbox

/// Photo Exif information.
public struct PhotoExif: Unboxable {

    // MARK: - Attributes

    /// Exif make.
    public let make: String?

    /// Exif model.
    public let model: String?

    /// Exif exposure time.
    public let exposureTime: String?

    /// Exif aperture.
    public let aperture: String?

    /// Exif focal length.
    public let focalLength: String?

    /// Exif iso value.
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
