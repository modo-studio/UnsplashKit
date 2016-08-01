import Foundation
import Core

public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (UIImage, NSURLResponse?)> {
    
    // MARK: - Singleton
    
    public static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()
    
    
    // MARK: - Public
    
    public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (UIImage, NSURLResponse?)! {
        guard let data = input.data, let image = UIImage(data: data) else {
            return (UIImage(), input.response)
        }
        return (image, input.response)
    }
    
}