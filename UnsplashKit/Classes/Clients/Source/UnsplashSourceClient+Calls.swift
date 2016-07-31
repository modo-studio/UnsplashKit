import Foundation
import RxSwift
import SwiftyJSON

extension UnsplashSourceClient {

    public func randomPhoto(fromCategory category: SourceCategory, size: (Int, Int)? = nil) -> Observable<UIImage> {
        return self.request(self.requestFactory.category(category)).map { $0.0 }
    }
    
}
