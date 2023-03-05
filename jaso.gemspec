require_relative "lib/jaso/version"

Gem::Specification.new do |spec|
  spec.name = "jaso"
  spec.version = Jaso::VERSION
  spec.authors = ["Vinicius Meneses"]
  spec.email = ["vinicius.meneses04@gmail.com"]
  spec.license = "MIT"

  spec.summary = "Just Another Service Object"
  spec.description = "Just Another Service Object"
  spec.homepage = "https://github.com/viniciusmeneses/jaso"

  spec.metadata = {
    "homepage_uri" => "https://github.com/viniciusmeneses/jaso",
    "documentation_uri" => "https://rubydoc.info/github/viniciusmeneses/jaso",
    "changelog_uri" => "https://github.com/viniciusmeneses/jaso/blob/main/CHANGELOG.md",
    "source_code_uri" => "https://github.com/viniciusmeneses/jaso",
    "bug_tracker_uri" => "https://github.com/viniciusmeneses/jaso/issues"
  }

  spec.files = Dir["lib/**/*", "CHANGELOG.md", "README.md", "LICENSE", "Gemfile", "jaso.gemspec"]
  spec.require_paths = ["lib"]

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.5.0"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"

  spec.add_development_dependency "standard", "~> 1.7"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-performance"
  spec.add_development_dependency "rubocop-rspec"
end
