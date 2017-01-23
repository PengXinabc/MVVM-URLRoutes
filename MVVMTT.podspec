
Pod::Spec.new do |s|

  s.name         = "MVVM"
  s.version      = "0.0.1"
  s.summary      = "一个简单的MVVM+URLRoutes,解耦项目架构,也可以为组件化、动态化路由做基础"
  s.description  = <<-DESC
                   MVVM,URLRoutes,RAC

  s.homepage     = "http://EXAMPLE/MVVMTT"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"


  s.author             = { "彭欣" => "pds296@126.com" }
 
   s.platform     = :ios, "8.0"

  s.source       = { :git => "http://EXAMPLE/MVVMTT.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = "MVVM", "MVVM/*.{h,m}"

  s.framework  = "UIKit"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
