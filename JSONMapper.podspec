Pod::Spec.new do |s|

  s.name         = "JSONMapper"
  s.version      = "0.0.1"
  s.summary      = "JSON Mapper for PONSOs"
  s.homepage     = "https://www.doordash.com"
  s.license      = "MIT"
  s.author             = { "Anderthan Hsieh" => "anderthan@gmail.com" }

  s.platform     = :ios, "9.0"

  s.source = { :git => 'https://github.com/elaser/swift-json-mapper.git', :tag => "0.0.2" }
  s.source_files  = "Mapper/**/*.{h,m,swift}"
  s.public_header_files = "Mapper/*.h"

  s.requires_arc = true

  s.xcconfig    = { 'SWIFT_VERSION' => '3.0' }

end
