platform :ios, '9.0'
 
workspace 'Compressor'

def lib_pods

  pod 'Tabman', '~> 1.8'
  pod 'AutoInsetter', '~> 1.2'
  pod 'Listenable', '~> 2.0'
  pod 'PureLayout', '~> 3.0.0'

end

target 'Compressor-Example' do
  project 'Example/Compressor-Example'
  use_frameworks!

  lib_pods

end

target 'Compressor' do
    project 'Sources/Compressor'
    use_frameworks!
  
    lib_pods

    target 'CompressorTests' do
      inherit! :search_paths
      # Pods for testing
    end
  end


