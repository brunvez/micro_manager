# frozen_string_literal: true

require_relative "lib/micro_manager/version"

Gem::Specification.new do |spec|
  spec.name          = "micro_manager"
  spec.version       = MicroManager::VERSION
  spec.authors       = ["Bruno Vezoli"]
  spec.email         = ["brunvez@gmail.com"]

  spec.license = "MIT"

  spec.summary       = "A utility to help get shit done"
  spec.description   = "A glorified TO-DO list with a couple of useful commands"
  spec.homepage      = "https://github.com/brunvez/micro_manager"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/brunvez/micro_manager"
  spec.metadata["changelog_uri"] = "https://github.com/brunvez/micro_manager/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tty-prompt", "~> 0.23.0"
  spec.add_dependency "tty-table", "~> 0.12.0"
  spec.add_development_dependency "rubocop", "~> 1.7"
end
