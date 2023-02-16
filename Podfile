# Uncomment the next line to define a global platform for your project
platform :ios, '16.2'

workspace 'ios_proto'

target 'protobuf' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  project 'protobuf/protobuf'

  # Pods for ios_proto
  pod 'SwiftProtobuf', '~> 1.0'
  # protobuf_pods

end

target 'ios_proto' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ios_proto
  pod 'SwiftProtobuf', '~> 1.0'


  # target 'ios_protoTests' do
  #   inherit! :search_paths
  #   # Pods for testing
  # end

  # target 'ios_protoUITests' do
  #   # Pods for testing
  # end

  post_install do |pi|

    pi.pods_project.build_configurations.each do |config|
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    end

		pi.pods_project.targets.each do |target|

      # https://github.com/CocoaPods/CocoaPods/issues/11196
      if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
        target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
        end
      end

			target.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
				config.build_settings['APPLICATION_EXTENSION_API_ONLY'] = 'No'
			end

		end

	end

end
