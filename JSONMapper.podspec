Pod::Spec.new do |s|

  s.name         = "JSONMapper"
  s.version      = "1.3"
  s.summary      = "JSON Mapper"
  s.homepage     = "https://www.doordash.com"
  s.license      = "MIT"
  s.author             = { "Anderthan Hsieh" => "anderthan@gmail.com" }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.12'

  s.source = { :git => 'https://github.com/doordash/swift-json-mapper.git', :tag => "1.3" }
  s.source_files  = "Mapper/**/*.{h,m,swift}"
  s.public_header_files = "Mapper/*.h"
  s.requires_arc = true
end
