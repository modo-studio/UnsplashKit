Pod::Spec.new do |s|
  s.name             = 'UnsplashKit'
  s.version          = '2.0.7'
  s.summary          = 'Client for Unsplash API'
  s.description      = <<-DESC
Swift client for unsplash.com API
                       DESC
  s.homepage         = 'https://github.com/carambalabs/UnsplashKit'
  s.social_media_url = "https://twitter.com/carambalabs"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Caramba.io' => 'hello@caramba.io' }
  s.source           = { :git => 'https://github.com/carambalabs/UnsplashKit.git', :tag => s.version.to_s }
  s.swift_version = '4.2'

  s.default_subspec = 'Source'

  s.subspec "Foundation" do |ss|
    ss.source_files = 'UnsplashKit/Classes/Foundation/**/*.swift'
    ss.dependency 'Unbox', '~> 2.3'
    ss.dependency 'Result', '~> 3.1'
    ss.dependency 'HTTPStatusCodes', '~> 3.1'
    ss.frameworks = ["CoreLocation"]
  end

  s.subspec "Source" do |ss|
    ss.dependency 'CarambaKit/Networking', '~> 1.0.9'
    ss.source_files = 'UnsplashKit/Classes/UnsplashSource/**/*.swift'
    ss.dependency 'UnsplashKit/Foundation'
  end

  s.subspec "API" do |ss|
    ss.source_files = 'UnsplashKit/Classes/UnsplashAPI/**/*.swift'
    ss.dependency 'UnsplashKit/Foundation'
  end

  # Targets
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

end
