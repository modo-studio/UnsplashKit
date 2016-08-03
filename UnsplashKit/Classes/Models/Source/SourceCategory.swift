import Foundation

public enum SourceCategory: String {
    
    case Buildings
    case Food
    case Nature
    case People
    case Technology
    case Objects
    
    var description: String {
        return self.rawValue.lowercaseString
    }
    
}
