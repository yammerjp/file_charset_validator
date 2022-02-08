require "file_charset_validator"
require "thor"
require "file_charset_validator/helper.rb"

class CLI < Thor
  default_command :check

  desc 'check', 'Check the character set of the file specified by the argument'
  option :encoding, type: :string, aliases: '-e', desc: 'Character set name'
  def check(*paths)
    if paths.empty?
      self.help
      return
    end

    begin
      FileCharsetValidator.check_paths_with_string_encoding(paths, options[:encoding] || 'UTF_8')
    rescue => e
      STDOUT.puts e
      exit 1
    end
    exit 0
  end
end
