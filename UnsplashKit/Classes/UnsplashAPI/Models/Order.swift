import Foundation

/// API possible orders.
///
/// - latest: order from the latest.
/// - oldest: order from the oldest.
/// - popular: older from the most popular.
public enum Order: String {
    case latest, oldest, popular
}
