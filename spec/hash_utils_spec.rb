require 'hash_utils'

include HashUtils

describe HashUtils do

  describe 'deep_symbolize_keys' do
    it 'converts simple hash' do
      hash = {'a' => 9} 
      expected = {a: 9}
      expect(deep_symbolize_keys(hash)).to eq(expected)
      expect(hash).not_to eq(expected)
    end

    it 'converts hash with sub-hashes' do
      hash = {'a' => {'b' => 10}}
      expected = {a: {b: 10}}
      expect(deep_symbolize_keys(hash)).to eq(expected)
      expect(hash).not_to eq(expected)
    end

    it 'converts hash with multiple levels and sub-hashes' do
      hash = {'a' => {'b' => {'c' => 99}, 'd' => {'foo' => 'bar'}}, 'e' => 100}
      expected = {a: {b: {c: 99}, d: {foo: 'bar'}}, e: 100}
      expect(deep_symbolize_keys(hash)).to eq(expected)
      expect(hash).not_to eq(expected)
    end
  end

  describe 'deep_symbolize_keys!' do
    it 'converts simple hash in-place' do
      hash = {'a' => 9} 
      expected = {a: 9}
      expect(deep_symbolize_keys!(hash)).to eq(expected)
      expect(hash).to eq(expected)
    end

    it 'converts hash with sub-hashes in-place' do
      hash = {'a' => {'b' => 10}}
      expected = {a: {b: 10}}
      expect(deep_symbolize_keys!(hash)).to eq(expected)
      expect(hash).to eq(expected)
    end

    it 'converts hash with multiple levels and sub-hashes in-place' do
      hash = {'a' => {'b' => {'c' => 99}, 'd' => {'foo' => 'bar'}}, 'e' => 100}
      expected = {a: {b: {c: 99}, d: {foo: 'bar'}}, e: 100}
      expect(deep_symbolize_keys!(hash)).to eq(expected)
      expect(hash).to eq(expected)
    end
  end
end
