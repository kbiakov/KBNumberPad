Pod::Spec.new do |s|
  s.name             = 'KBNumberPad'
  s.version          = '1.0.1'
  s.summary          = 'Customizable number pad as replacement of default.'

  s.description      = <<-DESC
KBNumberPad is a customizable number pad as replacement of default.
                       DESC

  s.homepage         = 'https://github.com/kbiakov/KBNumberPad'
  s.screenshots      = 'https://s21.postimg.org/w7aup8887/2017-05-14_20.29.02.png', 'https://s16.postimg.org/6pmpy72ut/2017-05-14_20.51.04.png', 'https://s3.postimg.org/mah7jtcmr/2017-05-14_20.59.17.png'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Kirill Biakov' => 'kiakov@gmail.com' }
  s.source           = { :git => 'https://github.com/kbiakov/KBNumberPad.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'KBNumberPad/Classes/**/*'
  
  s.resources = 'KBNumberPad/Assets/*.xcassets'

  # s.resource_bundles = {
  #   'KBNumberPad' => [
  #     'Resources/**/*.{png}',
  #     'Pod/**/*.xib'
  #   ]
  # }

  s.frameworks = 'UIKit'
end
