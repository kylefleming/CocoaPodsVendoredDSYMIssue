#
# Be sure to run `pod lib lint VendoredFramework.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VendoredFramework'
  s.version          = '0.1.0'
  s.summary          = 'A short description of VendoredFramework.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/kylefleming/CocoaPodsVendoredDSYMIssue'
  s.license          = { :type => 'MIT' }
  s.author           = { 'kylefleming' => 'kyle@kylefleming.net' }
  s.source       = { :http => "", :sha256 => "" }

  s.source_files = ''

  s.ios.deployment_target = '8.0'

  s.vendored_framework = 'Framework/VendoredFramework.framework'
end
