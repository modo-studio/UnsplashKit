import Foundation
import Quick
import Nimble
import OHHTTPStubs
import RxSwift

@testable import UnsplashKit

class UnsplashClientCallsSpec: QuickSpec {
    override func spec() {
        
        var subject: UnsplashClient!
        var image: UIImage!

        beforeEach() {
            subject = UnsplashClient()
            image = UIImage(contentsOfFile: Bundle(for: type(of: self)).path(forResource: "rocket", ofType: "png")!)
            _ = stub(condition: isHost("source.unsplash.com")) { _ in
                let stubData = UIImagePNGRepresentation(image)!
                return OHHTTPStubsResponse(data: stubData, statusCode:200, headers:nil)
            }
        }

        afterEach() {
            OHHTTPStubs.removeAllStubs()
            super.tearDown()
        }
        
        describe("-randomPhoto") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto()
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:fromSearch") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromSearch: ["o"])
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:fromCategory") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromCategory: .nature)
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:fromUser") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromUser: "o")
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:fromUserLikes") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromUserLikes: "o")
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:fromCollection") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.randomPhoto(fromCollection: "o")
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
        describe("-randomPhoto:identifier") {
            itBehavesLike("kit-call", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["observable"] = subject.photo("o")
                context["stubbedImage"] = image
                return context as (NSDictionary)
            })
        }
    }
}
