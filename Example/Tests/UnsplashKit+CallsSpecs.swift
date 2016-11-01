import Foundation
import Result
import Quick
import Nimble
import OHHTTPStubs

@testable import UnsplashKit

class UnsplashClientCallsSpec: QuickSpec {
    override func spec() {
        
        var subject: UnsplashClient!
        var imageData: Data!

        beforeEach() {
            subject = UnsplashClient()
            let image = UIImage(contentsOfFile: Bundle(for: type(of: self)).path(forResource: "rocket", ofType: "png")!)!
            imageData = UIImagePNGRepresentation(image)
            _ = stub(condition: isHost("source.unsplash.com")) { _ in
                return OHHTTPStubsResponse(data: imageData, statusCode:200, headers:nil)
            }
        }

        afterEach() {
            OHHTTPStubs.removeAllStubs()
            super.tearDown()
        }
        
        describe("-randomPhoto") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:fromSearch") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(fromSearch: ["o"], completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:fromCategory") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(fromCategory: .nature, completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:fromUser") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(fromUser: "o", completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:fromUserLikes") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(fromUserLikes: "o", completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:fromCollection") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.randomPhoto(fromCollection: "o", completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
        describe("-randomPhoto:identifier") {
            it("returns a valid photo") {
                var resultImageData: Data!
                waitUntil(timeout: 5) { done in
                    subject.photo("o", completion: { result in
                        resultImageData = UIImagePNGRepresentation(result.value!)
                        done()
                    })
                }
                expect(resultImageData).to(equal(imageData))
            }
        }
    }
}
