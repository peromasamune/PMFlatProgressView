Pod::Spec.new do |s|

  s.name         = "PMFlatProgressView"
  s.version      = "1.0.0"
  s.summary      = "Animated flat progressview for iOS"

  s.description  = <<-DESC
                   A longer description of PMFlatProgressView in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/peromasamune/PMFlatProgressView"
  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author       = { "t_inoue" => "peromasamune0037541@gmail.com" }

  s.platform     = :ios, '5.0'
  s.ios.deployment_target = '5.0'

  s.source       = { :git => "https://github.com/peromasamune/PMFlatProgressView.git", :tag => "1.0.0" }

  s.source_files  = 'PMFlatProgressView/Classes', 'PMFlatProgressView/Classes/**/*.{h,m}'
  s.exclude_files = ''

  s.framework  = 'UIKit'

  s.requires_arc = true

end
