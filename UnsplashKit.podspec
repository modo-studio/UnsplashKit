Pod::Spec.new do |s|
  s.name             = 'UnsplashKit'
  s.version          = '0.0.1'
  s.summary          = 'Client for Unsplash API'
  s.description      = <<-DESC
Swift client for unsplash.com API
                       DESC

  s.homepage         = 'https://github.com/tulapps/UnsplashKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Pedro Piñera Buendía' => 'pepibumur@gmail.com', 'Sergi Gracia' => 'sergigram@gmail.com', 'Isaal Roldán' => "isaac.roldan@gmail.com" }
  s.source           = { :git => 'https://github.com/tulapps/UnsplashKit.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'UnsplashKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'UnsplashKit' => ['UnsplashKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
