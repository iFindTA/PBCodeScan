Pod::Spec.new do |s|

  s.name         = "PBCodeScan"
  s.version      = "1.0.0"
  s.summary      = "qr/bar code scanner for iOS development."
  s.description  = "qr/bar code scanner for FLK.Inc iOS Developers, such as ViewController/View etc."

  s.homepage     = "https://github.com/iFindTA"
  s.license      = "MIT (LICENSE)"
  s.author             = { "nanhujiaju" => "hujiaju@hzflk.com" }
  s.platform     = :ios, "8.0"
  
  s.source       = { :git => "https://github.com/iFindTA/PBCodeScan.git", :tag => "#{s.version}" }
  s.source_files  = "PBCodeScan/Pod/Classes/*.{h,m}"
  s.public_header_files = "PBCodeScan/Pod/Classes/*.h"
  s.preserve_paths  = 'PBCodeScan/Pod/Classes/**/*'

  s.resources    = "PBCodeScan/Pod/Assets/*.xcassets"

  s.frameworks  = "UIKit","Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  #s.dependency "JSONKit", "~> 1.4"
  s.dependency 'Masonry'
  s.dependency 'PBBaseClasses'
  s.dependency 'ClusterPrePermissions'
end