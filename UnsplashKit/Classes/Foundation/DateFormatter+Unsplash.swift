import Foundation

// MARK: - Unsplash Date Formatter

internal extension DateFormatter {

    /// Unsplash date formatter.
    static var unsplash: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return formatter
    }

}
