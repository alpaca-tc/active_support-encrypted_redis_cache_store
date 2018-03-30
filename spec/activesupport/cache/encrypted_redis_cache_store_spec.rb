# frozen_string_literal: true

require 'json'

RSpec.describe ActiveSupport::Cache::EncryptedRedisCacheStore do
  describe 'VERSION' do
    it 'has a version number' do
      expect(described_class::VERSION).not_to be nil
    end
  end

  describe 'InstanceMethods' do
    let(:redis_options) do
      {
        url: 'redis://localhost:6379',
        encryptor_key: ActiveSupport::EncryptedFile.generate_key
      }
    end

    let(:redis) { instance.redis }

    let(:instance) do
      described_class.new(redis_options)
    end

    describe '#write' do
      subject do
        -> { instance.write(key, value) }
      end

      let(:key) { 'key' }
      let(:value) { 'value' }

      it 'writes value' do
        is_expected.to change {
          instance.exist?(key)
        }.from(false).to(true)
      end

      it 'encrypts value' do
        subject.call
        expect(redis.get(key)).to_not match('ActiveSupport')
        expect(redis.get(key)).to_not match(value)
      end
    end

    describe '#read' do
      let(:key) { 'key' }
      let(:value) { 'value' }

      it 'decrypts value' do
        instance.write(key, value)
        expect(instance.read(key)).to eq(value)
      end
    end
  end
end
