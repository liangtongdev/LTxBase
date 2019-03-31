Pod::Spec.new do |s|
  s.name         = "LTxBase"
  s.version      = "0.0.1"
  s.summary      = "iOS基础组件. "
  s.license      = "MIT"
  s.author             = { "liangtong" => "liangtongdev@163.com" }

  s.homepage     = "https://github.com/liangtongdev/LTxBase"
  s.platform     = :ios, "9.0"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/liangtongdev/LTxBase.git", :tag => "#{s.version}", :submodules => true }
  
  s.dependency 'MBProgressHUD' # hud
  s.dependency 'MJRefresh' # refresh
  s.dependency 'DZNEmptyDataSet' # empty view
  s.dependency 'LTxConfig'
  
  s.frameworks = "Foundation", "UIKit"

  #  s.default_subspecs = 'Controllers'



    # Core
  s.subspec 'Core' do |sp|
    sp.source_files  =  "LTxBase/*.{h,m}"
    sp.public_header_files = "LTxBase/*.h"
  end
end
