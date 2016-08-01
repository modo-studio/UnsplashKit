import Foundation
import Core

#if os(OSX)
    
    public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (NSImage, NSURLResponse?)> {
        
        // MARK: - Public
        
        public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (NSImage, NSURLResponse?)! {
            guard let data = input.data, let image = NSImage(data: data) else {
                return (NSImage(), input.response)
            }
            return (image, input.response)
        }
        
    }
    
#else
    
    public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (UIImage, NSURLResponse?)> {
        
        // MARK: - Public
        
        public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (UIImage, NSURLResponse?)! {
            guard let data = input.data, let image = UIImage(data: data) else {
                return (UIImage(), input.response)
            }
            return (image, input.response)
        }
        
    }
    
#endif
