# frozen_string_literal: true

require_relative "lib/omniauth/signicat_oauth2/version"

Gem::Specification.new do |spec|
  spec.name = "omniauth-signicat_oauth2"
  spec.version = OmniAuth::SignicatOauth2::VERSION
  spec.authors = ["Relatel"]
  spec.email = ["teknik@relatel.dk"]

  spec.summary = "OmniAuth strategy for Signicat"
  spec.description = "OmniAuth strategy for Signicat using OAuth2."
  spec.homepage = "https://github.com/relatel/omniauth-signicat_oauth2"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/relatel/omniauth-signicat_oauth2"
  spec.metadata["changelog_uri"] = "https://github.com/relatel/omniauth-signicat_oauth2/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "omniauth-oauth2", "~> 1.7"
end
