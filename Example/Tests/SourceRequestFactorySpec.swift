import Foundation
import Quick
import Nimble

@testable import UnsplashKit

class SourceRequestFactorySpec: QuickSpec {
    override func spec() {

        var subject: SourceRequestFactory!
        
        beforeEach {
            subject = SourceRequestFactory()
        }
        
        describe("-random") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.random()
                context["url"] = "https://source.unsplash.com/random"
                context["method"] = "GET"
                return context
            })
        }

        describe("-search") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.search(["nature", "mountain"])
                context["url"] = "https://source.unsplash.com/featured?nature,mountain"
                context["method"] = "GET"
                return context
            })
        }

        describe("-category") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.category(.Nature)
                context["url"] = "https://source.unsplash.com/category/nature"
                context["method"] = "GET"
                return context
            })
        }

        describe("-user") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.user("sergigracia")
                context["url"] = "https://source.unsplash.com/user/sergigracia"
                context["method"] = "GET"
                return context
            })
        }

        describe("-userLikes") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.userLikes("sergigracia")
                context["url"] = "https://source.unsplash.com/user/sergigracia/likes"
                context["method"] = "GET"
                return context
            })
        }

        describe("-collection") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.collection("12345")
                context["url"] = "https://source.unsplash.com/collection/12345"
                context["method"] = "GET"
                return context
            })
        }

        describe("-photo") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.photo("12345")
                context["url"] = "https://source.unsplash.com/12345"
                context["method"] = "GET"
                return context
            })
        }
        
        describe("-random:size:filter") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.random(CGSize(width: 1200, height: 800), filter: .Weekly)
                context["url"] = "https://source.unsplash.com/random/1200x800/weekly"
                context["method"] = "GET"
                return context
            })
        }
    }
}
