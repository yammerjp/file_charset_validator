require_relative 'lib/file_charset_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "file_charset_validator"
  spec.version       = FileCharsetValidator::VERSION
  spec.authors       = ["Keisuke Nakayama"]
  spec.email         = ["me@yammer.jp"]


  spec.summary       = "Validate file charset"
  spec.description   = "Validate what the character set of the specified file is. Is it UTF-8? or Shift-JIS? or ..."
  spec.homepage      = "https://github.com/yammerjp/file_charset_validator"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yammerjp/file_charset_validator"
  spec.metadata["changelog_uri"] = "https://github.com/yammerjp/file_charset_validator/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "thor"
end
