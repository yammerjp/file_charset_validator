require "file_charset_validator/version"
require "file_charset_validator/helper.rb"

class FileCharsetValidator
  def self.invalid_encoding_paths?(paths, encoding)
    paths.reject do |path|
      IO.binread(path.chomp).force_encoding(encoding).valid_encoding?
    end
  end

  def self.check_paths(paths, encoding)
    invalid_paths = self.invalid_encoding_paths?(paths, encoding)
    if !invalid_paths.empty?
      raise "There are invalid encoding files...\n#{invalid_paths.join("\n")}"
    end
  end

  def self.check_paths_with_string_encoding(paths, string_encoding)
    encoding = get_encoding(string_encoding)
    if encoding.nil?
      raise "unknown encoding: #{string_encoding}"
    end
    self.check_paths(paths, encoding)
  end
end
