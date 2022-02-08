require "file_charset_validator/version"
require "file_charset_validator/helper.rb"

class FileCharsetValidator
  def self.invalid_encoding_paths(paths, encoding)
    paths.reject do |path|
      IO.binread(path.chomp).force_encoding(encoding).valid_encoding?
    end
  end
end
