# frozen_string_literal: true

require_relative "lib/rubocop/treatwell/version"

Gem::Specification.new do |spec|
  spec.name = "rubocop-treatwell"
  spec.version = RuboCop::Treatwell::VERSION
  spec.authors = ["Treatwell Team"]
  spec.email = ["info@treatwell.com"]

  spec.summary = "Shared style guide for Treatwell Ruby projects"
  spec.description = "Treatwell::RubyStyle provides a set of shared style guide used across all Treatwell Ruby projects"
  spec.homepage = "https://github.com/treatwell/rubocop-treatwell"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  spec.metadata['rubygems_mfa_required'] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # These dependencies are included in all applications
  spec.add_runtime_dependency 'rubocop', '~> 1.50'
  spec.add_runtime_dependency 'rubocop-checkstyle_formatter', '~> 0.6'
  spec.add_runtime_dependency 'rubocop-performance', '~> 1.17'
  spec.add_runtime_dependency 'rubocop-rails', '~> 2.19'
  spec.add_runtime_dependency 'rubocop-rspec', '~> 2.22'
end
