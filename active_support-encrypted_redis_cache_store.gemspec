# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_support/cache/encrypted_redis_cache_store'

Gem::Specification.new do |spec|
  spec.name          = 'active_support-encrypted_redis_cache_store'
  spec.version       = ActiveSupport::Cache::EncryptedRedisCacheStore::VERSION
  spec.authors       = ['alpaca-tc']
  spec.email         = ['alpaca-tc@alpaca.tc']

  spec.summary       = 'active_support-encrypted_redis_store provides a encrypted cache for ActiveSupport.'
  spec.description   = 'active_support-encrypted_redis_store provides a encrypted cache for ActiveSupport. It protects your critical data by enabling runtime encryption in the redis_cache'
  spec.homepage      = 'https://github.com/alpaca-tc/active_support-encrypted_redis_cache_store'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 5.2.0.rc2'
  spec.add_dependency 'redis', '>= 4.0.1'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
