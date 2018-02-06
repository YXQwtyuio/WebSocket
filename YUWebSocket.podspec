Pod::Spec.new do |s|
s.name = 'YUWebSocket' s.version = '0.0.2'
s.license = 'MIT'
s.summary = 'websocket'
s.homepage = 'https://github.com/YXQwtyuio/WebSocket.git'
s.authors = { 'YXQwtyuio' => 'hongyuyrui@foxmail.com' }
s.source = { :git => "https://github.com/YXQwtyuio/WebSocket.git", :tag => "0.0.2"}
s.requires_arc = trues.ios.deployment_target = '8.0'
s.source_files = "*.{h,m}"
# s.source = "HeziSDK/HeziSDK.bundle"
# s.frameworks = 'UIKit'
end
