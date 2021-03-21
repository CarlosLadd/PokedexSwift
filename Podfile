# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'PokedexSwift' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for PokedexSwift
  pod 'SwiftLint'
  pod 'Swinject'
  pod 'Kingfisher'

  target 'PokedexSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'PokedexSwiftUITests' do
    # Pods for testing
  end

end

post_install do |installer|
 installer.pods_project.targets.each do |target|
  target.build_configurations.each do |config|
   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
  end
 end
end
