require "file_charset_validator"
require "thor"
require "file_charset_validator/helper.rb"

class CLI < Thor
  default_command :check

  desc 'check', 'Check the character set of the file specified by the argument'
  option :encoding, type: :string, aliases: '-e', desc: 'Encoding name (ex. UTF_8, Shift_JIS, EUC_JP)'
  def check(*paths)
    if paths.empty?
      self.help
      return
    end

    encoding = get_encoding(options[:encoding] || 'UTF_8')
    if encoding.nil?
      STDERR.puts "Unknown encoding: #{options[:encoding]}"
      exit 1
    end

    invalid_paths = FileCharsetValidator.invalid_encoding_paths(paths, encoding)
    head = "Invalid encoding file: "
    if !invalid_paths.empty?
      STDERR.puts "#{head}#{invalid_paths.join("\n#{head}")}"
      exit 1
    end
  end
end
