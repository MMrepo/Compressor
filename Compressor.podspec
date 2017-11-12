Pod::Spec.new do |s|
  
  s.name         = "Compressor"
  s.platform     = :ios, "9.0"
  s.requires_arc = true

  s.version      = "0.1.0"
  s.summary      = "TODO"
  s.description  = <<-DESC
  					TODO
                   DESC

  s.homepage          = "https://github.com/uias/Compressor"
  s.license           = "MIT"
  s.author            = { "Merrick Sapsford" => "merrick@sapsford.tech" }
  s.social_media_url  = "http://twitter.com/MerrickSapsford"

  s.source       = { :git => "https://github.com/uias/Compressor.git", :tag => s.version.to_s }
  s.source_files = "Sources/Compressor/**/*.{h,m,swift}"

  s.dependency 'Tabman', '~> 1.0'

end
