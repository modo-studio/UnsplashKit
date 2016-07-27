import Foundation
import Core

public class UrlDataResponseAdapter: Adapter<(data: NSData?, response: NSURLResponse?), (NSData, NSURLResponse?)> {
    
    // MARK: - Singleton
    
    public static var instance: UrlDataResponseAdapter = UrlDataResponseAdapter()
    
    
    // MARK: - Public
    
    public override func adapt(input: (data: NSData?, response: NSURLResponse?)) -> (NSData, NSURLResponse?)! {
        return (input.data!, input.response)
    }
    
}