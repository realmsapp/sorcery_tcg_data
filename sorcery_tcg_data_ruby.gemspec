# frozen_string_literal: true

gem_source = "src/sorcery_tcg_data_ruby"
require_relative File.join(gem_source, "lib/sorcery_tcg_data/version")

Gem::Specification.new do |spec|
  spec.name = "sorcery_tcg_data_ruby"
  spec.version = SorceryTcgData::VERSION
  spec.authors = ["Tony Schneider"]
  spec.email = ["tonywok@gmail.com"]

  spec.summary = "sorcery tcg data files packaged as a ruby gem"
  spec.homepage = "https://github.com/realmsapp/sorcery_tcg_data"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/realmsapp/sorcery_tcg_data"

  spec.files = Dir["data/**/*", "LICENSE", "README.md", "sorcery_tcg_data_ruby.gemspec", "src/sorcery_tcg_ruby/**/*"]
  spec.bindir = File.join(gem_source, "bin")
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["src/sorcery_tcg_data_ruby/lib"]

  spec.add_dependency "value_semantics"
  spec.add_dependency "activesupport"
end
