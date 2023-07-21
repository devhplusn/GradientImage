Pod::Spec.new do |spec|
  spec.name                   = 'GradientImage'
  spec.version                = '1.0.0'
  spec.summary                = 'This library easily generates gradient colors and images'
  spec.homepage               = 'https://github.com/devhplusn/GradientImage'
  spec.license                = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                 = { 'Hanwoong Na' => 'devhplusn@gmail.com' }
  spec.source                 = { :git => 'https://github.com/devhplusn/GradientImage.git', :tag => s.version.to_s }

  spec.ios.deployment_target  = '13.0'
  spec.source_files           = 'Sources/GradientImage/**/*'
  spec.swift_versions         = ['5']

end
