import Foundation
import Core

#if os(OSX)
    public typealias UnsplashImage = NSImage
#else
    public typealias UnsplashImage = UIImage
#endif

public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (UnsplashImage, NSURLResponse?)> {
    
    // MARK: - Public
    
    public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (UnsplashImage, NSURLResponse?)! {
        guard let data = input.data, let image = UnsplashImage(data: data) else {
            return (UnsplashImage(), input.response)
        }
        return (image, input.response)
    }
    
}
