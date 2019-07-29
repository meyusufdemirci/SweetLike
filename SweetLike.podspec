
Pod::Spec.new do |s|
s.name             = 'SweetLike'
s.version          = '0.2.1'
s.summary          = 'A beautiful like button.'
s.description      = 'The SweetLike is a completely customizable like button that can be used in any iOS application.'

s.homepage         = 'https://github.com/demirciy/SweetLike'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Yusuf Demirci' => 'demirciy94@gmail.com' }
s.source           = { :git => 'https://github.com/demirciy/SweetLike.git', :tag => s.version.to_s }

s.ios.deployment_target = '9.3'
s.swift_version = '5.0'

s.source_files = 'SweetLike/Classes/**/*'
#s.resource_bundles = {
#'SweetLike' => ['SweetLike/Assets/*.png']
#}
s.resources    = 'SweetLike/**/Assets/*.png'

end
