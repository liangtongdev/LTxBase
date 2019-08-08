Pod::Spec.new do |s|
  s.name         = "LTxBase"
  s.version      = "0.0.2"
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
  s.dependency 'LTxCategories'
  
  s.frameworks = "Foundation", "UIKit"


  # View
  s.subspec 'View' do |view|
    view.source_files  =  "LTxBase/View/*.{h,m}"
    view.public_header_files = "LTxBase/View/*.h"
  end
  
  # View
  s.subspec 'ViewModel' do |vm|
    vm.source_files  =  "LTxBase/ViewModel/*.{h,m}"
    vm.public_header_files = "LTxBase/ViewModel/*.h"
  end
  
  # View
  s.subspec 'Controller' do |controller|
    controller.source_files  =  "LTxBase/Controller/*.{h,m}"
    controller.public_header_files = "LTxBase/Controller/*.h"
    controller.dependency  "LTxBase/View"
    controller.dependency "LTxBase/ViewModel"
  end

    # Core
  s.subspec 'Core' do |core|
    core.source_files  =  "LTxBase/LTxBase.h"
    core.public_header_files = "LTxBase/LTxBase.h"
    core.dependency "LTxBase/Controller"
  end
end
