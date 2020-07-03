

Pod::Spec.new do |s|
  s.name             = 'PseudoPieGraph'
  s.version          = '1.0.0'
  s.summary          = 'Light weight pie graph for simple usage'

  s.description      = 'Pseudo Pie Graph is a light weigh pie graph for simple usage.'

  s.homepage         = 'https://github.com/pseudozain'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pseudozain' => 'e.zainulabedin@gmail.com' }
  s.source           = { :git => 'https://github.com/pseudozain/PseudoPieGraph.git', :tag => s.version.to_s }

  s.module_name = s.name
  s.ios.deployment_target = '11.4'
  s.swift_version = '5.1'
  
  s.source_files = 'PseudoPieGraph/**/*.{swift}'
  
  s.static_framework = true
end
