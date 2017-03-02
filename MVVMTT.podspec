
Pod::Spec.new do |s|

  s.name         = "MVVMTT"
  s.version      = "0.0.1"
  s.summary      = "MVVM,URLRoutes,RAC"
  s.description  = <<-DESC
                   一个简单的MVVM+URLRoutes,解耦项目架构,也可以为组件化、动态化
路由做基础
		   DESC

  s.homepage     = "https://github.com/PengXinabc/MVVM-URLRoutes"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license      = "MIT"


  s.author             = { "彭欣" => "pds296@126.com" }
 
  s.platform     = :ios, "8.0"
  s.dependency "JLRoutes", "~> 2.0"

  s.source       = { :git => "https://github.com/PengXinabc/MVVM-URLRoutes.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  s.source_files  = 'MVVMTT/MVVM/*.{h,m}'

  s.framework  = "UIKit"

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
