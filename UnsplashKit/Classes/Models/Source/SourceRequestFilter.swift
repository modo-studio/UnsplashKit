import Foundation

enum SourceRequestFilter: String {
    
    case None
    case Daily
    case Weekly
    
    var description: String {
        return self.rawValue.lowercaseString
    }
    
}
