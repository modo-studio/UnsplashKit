#if os(OSX)
    import AppKit
    public typealias UnsplashImage = NSImage
#else
    import UIKit
    public typealias UnsplashImage = UIImage
#endif
