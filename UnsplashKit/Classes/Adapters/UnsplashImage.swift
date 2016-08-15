#if os(OSX)
    import AppKit
    public typealias UnsplashImage = NSImage
#elseif os(watchOS)
    import WatchKit
    public typealias UnsplashImage = UIImage
#else
    import UIKit
    public typealias UnsplashImage = UIImage
#endif
