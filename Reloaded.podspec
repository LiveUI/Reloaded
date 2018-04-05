#
# Be sure to run `pod lib lint Reloaded.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'Reloaded'
    s.version          = '1.0.1'
    s.summary          = 'Reloaded! Swift "ORM like" abstraction layer for CoreData'
    s.swift_version    = '4.0'

    # This description is used to generate tags and improve search results.
    #   * Think: What does it do? Why did you write it? What is the focus?
    #   * Try to keep it short, snappy and to the point.
    #   * Write the description between the DESC delimiters below.
    #   * Finally, don't worry about the indent, CocoaPods strips it!

    s.description      = <<-DESC
    Using Reloaded is super simple, in the basic configuration you don't have to write a single line of setup you would probably otherwise have in your AppDelegate but you can obviously still leverage your apps delegate methods as you would otherwise.
                       DESC

    s.homepage         = 'https://github.com/LiveUI/Reloaded'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'rafiki270' => 'dev@liveui.io' }
    s.source           = { :git => 'https://github.com/LiveUI/Reloaded.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/rafiki270'

    s.ios.deployment_target = '10.0'
    s.tvos.deployment_target = '10.0'
    s.macos.deployment_target = '10.12'
    s.watchos.deployment_target = '4.3'

    s.source_files = 'Classes/**/*'

    # s.resource_bundles = {
    #   'Reloaded' => ['Reloaded/Assets/*.png']
    # }

    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
