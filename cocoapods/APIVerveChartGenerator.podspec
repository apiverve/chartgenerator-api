Pod::Spec.new do |s|
  s.name             = 'APIVerveChartGenerator'
  s.version          = '1.2.3'
  s.summary          = 'Chart Generator is a chart API that turns your data into chart and graph images.'
  s.description      = <<-'DESC'
Chart Generator is a chart API that turns your data into chart and graph images. Supports bar, line, pie, doughnut, radar, polar area, scatter and bubble charts with customizable styling.

This iOS/macOS SDK provides a convenient way to access the Chart Generator from APIVerve.
Supports both callback-based and async/await patterns.
                       DESC

  s.homepage         = 'https://apiverve.com/marketplace/chartgenerator?utm_source=cocoapods&utm_medium=referral&utm_content=homepage'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'APIVerve' => 'hello@apiverve.com' }
  # The SDK repo holds every language; the pod lives under cocoapods/ with its own tag.
  s.source           = { :git => 'https://github.com/apiverve/chartgenerator-api.git', :tag => "cocoapods/v#{s.version}" }

  s.ios.deployment_target = '15.0'
  s.osx.deployment_target = '12.0'

  s.swift_version = '5.0'

  s.source_files = 'cocoapods/Sources/APIVerveChartGenerator/**/*.swift'

  s.frameworks = 'Foundation'

  # APIResponse, APIVerveError and the request plumbing, shared by every APIVerve pod.
  s.dependency 'APIVerveCore', '~> 1.2'
end
