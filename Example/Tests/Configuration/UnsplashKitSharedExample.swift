import Foundation
import Quick
import Nimble
import RxSwift

@testable import UnsplashKit

class UnsplashClientSharedExample: QuickConfiguration {
    override class func configure(_ configuration: Configuration) {
        sharedExamples("kit-call") { (sharedExampleContext: @escaping SharedExampleContext) in

            var observable: Observable<UnsplashImage>!
            var stubbedImage: UIImage!

            beforeEach {
                let context = sharedExampleContext()
                observable = context["observable"] as! Observable<UnsplashImage>
                stubbedImage = context["stubbedImage"] as! UIImage
            }

            it("should return the correct image") {
                var resultImage: UIImage?
                waitUntil(timeout: 10) { done in
                    _ = observable.subscribe(onNext: { element in
                        resultImage = element
                        done()
                    })
                }
                let stubbedImageData = UIImagePNGRepresentation(stubbedImage)!
                let resultImageData = UIImagePNGRepresentation(resultImage!)!
                expect(resultImageData.count).to(equal(stubbedImageData.count))
            }
        }
    }
}
