Pod::Spec.new do |s|
  s.name             = 'Readability-Swift'
  s.version          = '0.1.0'
  s.summary          = 'Metrics to determine readability and comprehension difficulty for contemporary English text.'
  s.description      = <<-DESC
Metrics to determine readability and comprehension difficulty for contemporary English text. Included are Automated Readability Index, Coleman–Liau Index, Flesch-Kincaid Grade Level, Flesch Reading Ease, Gunning Fog Index, and SMOG Grade.
                       DESC
  s.homepage         = 'https://brackendev.github.io/Readability-Swift/'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'brackendev' => 'GitHub @brackendev' }
  s.source           = { :git => 'git@github.com:brackendev/Readability-Swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.3'
  s.source_files = 'Readability-Swift/Classes/**/*'
  s.frameworks = 'Foundation'
  s.dependency 'RegexKitLite', '4.0'
  s.swift_version = "5.1"
end
