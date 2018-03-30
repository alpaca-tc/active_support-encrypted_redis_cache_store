# frozen_string_literal: true

require 'active_support/cache'
require 'active_support/cache/redis_cache_store'
require 'active_support/encrypted_file'
require 'active_support/message_encryptor'

module ActiveSupport
  module Cache
    class EncryptedRedisCacheStore < RedisCacheStore
      VERSION = '0.1.0'

      attr_reader :encryptor_key

      def initialize(encryptor_key: nil, **options)
        @encryptor_key = encryptor_key

        unless encryptor_key
          raise ArgumentError, 'missing :encryptor_key option. Please generate encryptor_key `ActiveSupport::EncryptedFile.generate_key`'
        end

        super(**options)
      end

      private

      def deserialize_entry(serialized_entry)
        return unless serialized_entry
        super(encryptor.decrypt_and_verify(serialized_entry))
      end

      def serialize_entry(*)
        encryptor.encrypt_and_sign(super)
      end

      def encryptor
        @encryptor ||= ActiveSupport::MessageEncryptor.new(
          [encryptor_key].pack('H*'),
          cipher: 'aes-128-gcm'
        )
      end
    end
  end
end
