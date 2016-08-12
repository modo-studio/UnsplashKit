Pod::Spec.new do |s|
  s.name             = 'UnsplashKit'
  s.version          = '0.0.8'
  s.summary          = 'Client for Unsplash API'
  s.description      = <<-DESC
Swift client for unsplash.com API
                       DESC
  s.homepage         = 'https://github.com/carambalabs/UnsplashKit'
  s.social_media_url = "https://twitter.com/carambalabs"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pedro Piñera Buendía' => 'pepibumur@gmail.com', 'Sergi Gracia' => 'sergigram@gmail.com', 'Isaal Roldán' => "isaac.roldan@gmail.com" }
  s.source           = { :git => 'https://github.com/carambalabs/UnsplashKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'UnsplashKit/Classes/**/*'
  
  s.dependency 'CarambaKit/Networking', '~> 0.0'

  s.ios.deployment_target = '8.0'
  # s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

end
