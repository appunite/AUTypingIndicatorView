Pod::Spec.new do |s|
  s.name         = 'AUTypingIndicatorView'
  s.version      = '1.0.0'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://www.appunite.com'
  s.authors      =  {'Hubert Drąg' => 'hubert.drag@appunite.com'}
  s.summary      = 'Customizable message typing indicator.'
#  s.screenshots  = ["http://acpdownload-gif.gif",
#                    "http://acpdownload-screenshot-1.png"]

  s.platform     =  :ios, '7.0'
  s.source       = { :git => "https://github.com/appunite/AUTypingIndicatorView.git", :tag => s.version.to_s }
  s.source_files = 'AUTypingIndicatorView'
  s.requires_arc = true
end