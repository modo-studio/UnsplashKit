import Foundation
import Quick
import Nimble

@testable import UnsplashKit

class SourceRequestFactorySharedExample: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("factory-request") { (sharedExampleContext: @escaping SharedExampleContext) in
            
            var url: String!
            var request: NSURLRequest!
            var method: String!
            
            beforeEach {
                let context = sharedExampleContext()
                request = context["request"] as! NSURLRequest
                url = context["url"] as! String
                method = context["method"] as! String
            }
            
            it("should have the correct url") {
                expect(request.url?.absoluteString) == url
            }
            
            it("should have the correct method") {
                expect(request.httpMethod) == method
            }
        }
    }
}
