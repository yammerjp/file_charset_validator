require "file_charset/version"
require "file_charset/helper.rb"

class FileCharset
  def self.invalid_encoding_paths?(paths, encoding)
    paths.reject do |path|
      IO.binread(path.chomp).force_encoding(encoding).valid_encoding?
    end
  end

  def self.check_paths(paths, encoding)
    invalid_paths = self.invalid_encoding_paths?(paths, encoding)
    if !invalid_paths.empty?
      self.message "There are invalid encoding files...\n#{invalid_paths.join("\n")}"
    end
    invalid_paths.empty?
  end

  def self.check_paths_with_string_encoding(paths, string_encoding)
    if string_encoding.nil?
      encoding = Encoding::UTF_8
    else
      encoding = get_encoding(string_encoding)
      if encoding.nil?
        throw "unknown encoding: #{string_encoding}"
      end
    end
    self.check_paths(paths, encoding)
  end
end
