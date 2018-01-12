#
# Be sure to run `pod lib lint SBGradientView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SBGradientView'
  s.version          = '0.2.0'
  s.summary          = 'Convenient UIView wrapper around CAGradientLayer'


  s.description      = <<-DESC
It's waaaaaayyyyy too much work to make a gradient on iOS, so I made this wrapper to make my life easier
                       DESC

  s.homepage         = 'https://github.com/SteveBarnegren/SBGradientView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Steve Barnegren' => 'steve.barnegren@himumsaiddad.com' }
  s.source           = { :git => 'https://github.com/SteveBarnegren/SBGradientView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/SteveBarnegren'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SBGradientView/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'MapKit'
end
