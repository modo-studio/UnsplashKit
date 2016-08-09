import Foundation
import Quick
import Nimble
import Mockingjay
import RxSwift

@testable import UnsplashKit

class UnsplashKitCallsSpec: QuickSpec {
    override func spec() {
        
        var subject: UnsplashKit!
        var requestFactory: SourceRequestFactory!
        var image: UIImage!
        
        func builder(request: NSURLRequest) -> Response {
            let imageData = UIImagePNGRepresentation(image)
            let response = NSHTTPURLResponse(URL: request.URL!, statusCode: 200, HTTPVersion: nil, headerFields: nil)!
            return .Success(response, imageData)
        }
        
        beforeEach() {
            subject = UnsplashKit()
            requestFactory = SourceRequestFactory()
            image = UIImage(contentsOfFile: NSBundle(forClass: self.dynamicType).pathForResource("rocket", ofType: "png")!)
            
            self.stub(uri(requestFactory.random().URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.search(["o"]).URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.category(.Nature).URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.user("o").URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.userLikes("o").URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.collection("o").URL!.absoluteString), builder: builder)
            self.stub(uri(requestFactory.photo("o").URL!.absoluteString), builder: builder)
        }
        
        afterEach() {
            self.removeAllStubs()
        }
        
        describe("-randomPhoto") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto()
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:fromSearch") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromSearch: ["o"])
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:fromCategory") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromCategory: .Nature)
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:fromUser") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromUser: "o")
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:fromUserLikes") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromUserLikes: "o")
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:fromCollection") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromCollection: "o")
                context["stubbedImage"] = image
                return context
            })
        }
        describe("-randomPhoto:identifier") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.photo("o")
                context["stubbedImage"] = image
                return context
            })
        }
    }
}
