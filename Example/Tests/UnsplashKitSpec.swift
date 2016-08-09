import Foundation
import Quick
import Nimble

@testable import UnsplashKit

extension SourceRequestFactory: Equatable {}
public func ==(lhs: SourceRequestFactory, rhs: SourceRequestFactory) -> Bool {
    return lhs === rhs
}


class UnsplashKitSpec: QuickSpec {
    override func spec() {
        
        let requestFactory = SourceRequestFactory()
                
        describe("-init") {
            let kit = UnsplashKit(requestFactory: requestFactory)
            expect(kit.requestFactory).to(equal(requestFactory))
        }
    }
}
