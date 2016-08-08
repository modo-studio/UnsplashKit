import Foundation
import Quick
import Nimble

@testable import UnsplashKit

class UrlDataResponseAdatperSpec: QuickSpec {
    override func spec() {
        
        var adapter: UrlDataResponseAdapter!
        
        beforeEach {
            adapter = UrlDataResponseAdapter()
        }
        
        describe("-adapt") {
            
            let data = NSData()
            let response = NSURLResponse()
        
            it("returns the response adapted") {
                //let image = adapter.adapt((data, response)).0
            }
        }
    }
}