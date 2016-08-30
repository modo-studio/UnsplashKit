Pod::Spec.new do |s|
  s.name             = 'UnsplashKit'
  s.version          = '0.0.19'
  s.summary          = 'Client for Unsplash API'
  s.description      = <<-DESC
Swift client for unsplash.com API
                       DESC
  s.homepage         = 'https://github.com/carambalabs/UnsplashKit'
  s.social_media_url = "https://twitter.com/carambalabs"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Caramba.in' => 'hello@caramba.in' }
  s.source           = { :git => 'https://github.com/carambalabs/UnsplashKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'UnsplashKit/Classes/**/*'

  s.dependency 'CarambaKit/Networking', '~> 0.0'

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

end
