Pod::Spec.new do |s|
s.name = 'DDKitSwift_NetCheck'
s.swift_version = '5.0'
s.version = '1.0.1'
s.license= { :type => "MIT", :file => "LICENSE" }
s.summary = "A network status diagnostic tool for iOS, compatible with DDKitSwift"
s.homepage = 'https://github.com/DamonHu/DDKitSwift_NetCheck'
s.authors = { 'DamonHu' => 'dong765@qq.com' }
s.source = { :git => "https://github.com/DamonHu/DDKitSwift_NetCheck", :tag => s.version}
s.requires_arc = true
s.ios.deployment_target = '12.0'
s.subspec 'core' do |cs|
    cs.resource_bundles = {
      'DDNetCheck' => ['Pods/assets/**/*']
    }
    cs.source_files = "Pods/*.swift"
    cs.dependency 'DDNetCheck'
    cs.dependency 'DDKitSwift/core', '~> 4'
end

s.default_subspecs = "core"
s.frameworks = 'Foundation'
s.documentation_url = 'hhttps://dongge.org/blog/1296.html'
end