Pod::Spec.new do |s|
  s.name             = "MQTTSdkWrapper"
  s.version          = "1.0.0"
  s.summary          = "MQTT SDK Wrapper for KMM"
  s.homepage         = "https://github.com/mekhak1111/MQTTSdkWrapper"
  s.license          = { :type => "MIT" }
  s.author           = { "Mekhak Ghapantsyan" => "mekhakghapantsyan@gmail.com" }
  s.source = { :git => "https://github.com/mekhak1111/MQTTSdkWrapper" }
  s.platform         = :ios, "16.0"

  # IMPORTANT: local podspec → NO source field
  # REMOVE s.source completely for local pods

  # CocoaMQTT dependency
  s.dependency 'CocoaMQTT'

  # Vendored framework
  s.vendored_frameworks = "build/Release/MQTTSdkWrapper.framework"

  s.public_header_files = "MQTTSdkWrapper/MQTTSdkWrapper.h"

  s.requires_arc = true

  s.pod_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64 x86_64'
  }
end
