
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "activesupport/encrypted_redis_store/version"

Gem::Specification.new do |spec|
  spec.name          = "activesupport-encrypted_redis_store"
  spec.version       = Activesupport::EncryptedRedisStore::VERSION
  spec.authors       = ["alpaca-tc"]
  spec.email         = ["alpaca-tc@alpaca.tc"]

  spec.summary       = %q{Write a short summary, because RubyGems requires one.}
  spec.description   = %q{Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/alpaca-tc/activesupport-encrypted_redis_store"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport', '>= 5.2.0.rc2'

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry'
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rubocop'
end
