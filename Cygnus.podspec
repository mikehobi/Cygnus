Pod::Spec.new do |spec|
  spec.name = "RGB"
  spec.version = "1.0.0"
  spec.summary = "Experimental declarative UIView abstraction"
  spec.homepage = "https://github.com/mikehobi/Cygnus"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Mike Hobizal" => 'mike.hobizal@instrument.com' }

  spec.platform = :ios, "11.0"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/mikehobi/Cygnus.git", tag: "v#{spec.version}", submodules: true }
  spec.source_files = "Cygnus/**/*.{h,swift}"

  spec.dependency "SnapKit", "== 5.0.0"
  spec.dependency "BonMot", "== 5.4"
end