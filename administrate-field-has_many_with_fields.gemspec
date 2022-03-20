# frozen_string_literal: true

# require_relative "lib/administrate/field/has_many_with_fields/version"

Gem::Specification.new do |spec|
  spec.name = "administrate-field-has_many_with_fields"
  # spec.version = Administrate::Field::HasManyWithFields::VERSION
  spec.version = "0.1.0"
  spec.authors = ["James Newman"]
  spec.email = ["jamesmnewman1@gmail.com"]

  spec.summary = "Administrate has_many field extension to only use certain fields in a has_many collection"
  # spec.description = "TODO: Write a longer description or delete this line."
  spec.homepage = "https://github.com/jnewman12/administrate-field-has_many_with_fields"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.5.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to your gem server 'https://example.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/jnewman12/administrate-field-has_many_with_fields"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "administrate"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
