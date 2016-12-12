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
                context["request"] = subject.random() as AnyObject?
                context["url"] = "https://source.unsplash.com/random" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-search") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.search(["nature", "mountain"]) as AnyObject?
                context["url"] = "https://source.unsplash.com/featured?nature,mountain" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-category") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.category(.nature) as AnyObject?
                context["url"] = "https://source.unsplash.com/category/nature" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-user") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.user("sergigracia") as AnyObject?
                context["url"] = "https://source.unsplash.com/user/sergigracia" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-userLikes") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.userLikes("sergigracia") as AnyObject?
                context["url"] = "https://source.unsplash.com/user/sergigracia/likes" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-collection") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.collection("12345") as AnyObject?
                context["url"] = "https://source.unsplash.com/collection/12345" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }

        describe("-photo") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.photo("12345") as AnyObject?
                context["url"] = "https://source.unsplash.com/12345" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }
        
        describe("-random:size:filter") {
            itBehavesLike("factory-request", sharedExampleContext: { () -> (NSDictionary) in
                var context: [String: AnyObject] = [:]
                context["request"] = subject.random(CGSize(width: 1200, height: 800), filter: .weekly) as AnyObject?
                context["url"] = "https://source.unsplash.com/random/1200x800/weekly" as AnyObject?
                context["method"] = "GET" as AnyObject?
                return context as (NSDictionary)
            })
        }
    }
}
