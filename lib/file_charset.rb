require "file_charset/version"

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
end
