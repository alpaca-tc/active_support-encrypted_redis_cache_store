# Activesupport::Cache::EncryptedRedisStore

active_support-encrypted_redis_store provides a encrypted cache for ActiveSupport.
It protects your critical data by enabling runtime encryption in the redis_cache.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'active_support-encrypted_redis_cache_store'
```

## Usage

Configure cache_store in your rails application.

```ruby
# config/application.rb
config.cache_store = :encrypted_redis_cache_store, {
  url: 'redis://localhost:6379',
  encryptor_key: ENV['ENCRYPTOR_KEY'] # Generated key `ActiveSupport::EncryptedFile.generate_key`
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alpaca-tc/active_support-encrypted_redis_store.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
