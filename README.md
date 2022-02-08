# file_charset_validator

file_charset_validator is CLI tool to validate text files' encoding.

This is implemented by ruby, and distributed as a gem.

## Installation

Install it yourself as:

```
$ gem install file_charset_validator
```

## Usage


```sh
$ file_charset_validator --encoding UTF_8 path/to/file/1 path/to/file/2
```

If the character codes of `path/to/file/1` and `path/to/file/2` are both UTF_8, it will exit normally.
Otherwise, it will output a message and exit abnormally.


### Options

`--encoding` (`-e`)

You can specify the character encoding to be verified.
The character encoding that can be specified is defined as a constant in the encoding class of the ruby built-in library.

### Arguments

`<path, ...>`

You can specify one or more file paths to be verified.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/file_charset_validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/file_charset_validator/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FileCharset project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/file_charset_validator/blob/master/CODE_OF_CONDUCT.md).
