import Foundation
import Quick
import Nimble
import RxSwift

@testable import UnsplashKit

class UnsplashClientSharedExample: QuickConfiguration {
    override class func configure(configuration: Configuration) {
        sharedExamples("kit-call") { (sharedExampleContext: SharedExampleContext) in
            
            var observable: Observable<UnsplashImage>!
            var stubbedImage: UIImage!
            
            beforeEach {
                let context = sharedExampleContext()
                observable = context["observable"] as! Observable<UnsplashImage>
                stubbedImage = context["stubbedImage"] as! UIImage
            }
            
            it("should return the correct image") {
                var resultImage: UIImage?
                waitUntil { done in
                    _ = observable.subscribeNext { image in
                        resultImage = image
                        done()
                    }
                }
                let stubbedImageData = UIImagePNGRepresentation(stubbedImage)!
                let resultImageData = UIImagePNGRepresentation(resultImage!)!
                expect(resultImageData.length).to(equal(stubbedImageData.length))
            }
        }
    }
}
