# Number of utility functions to include in Hash or any Hash-like class

module HashUtils
  module_function

  def deep_symbolize_keys(hash)
    result = hash.map do |key, value|
      value = deep_symbolize_keys(value) if value.class == Hash
      [key.to_sym, value]
    end
    Hash[result]
  end

  def deep_symbolize_keys!(hash)
    hash.replace(deep_symbolize_keys(hash))
  end

  def subhash(hash, keys)
    hash.select { |key, value| keys.include?(key) }
  end
end

#
# include in Hash
module HashExtension
  def deep_symbolize_keys
    _deep_symbolize_keys(self)
  end

  def deep_symbolize_keys!
    replace(deep_symbolize_keys)
  end

  def subhash(keys)
    select { |key, value| keys.include?(key) }
  end

  def all_keys?(keys)
    keys.all? { |key| key?(key) }
  end

  def any_key?(keys)
    keys.any? { |key| key?(key) }
  end

  def missing_key?(key)
     !key?(key)
  end

  private

  def _deep_symbolize_keys(hash)
    result = hash.map do |key, value|
      value = _deep_symbolize_keys(value) if value.class == Hash
      [key.to_sym, value]
    end
    Hash[result]
  end
end
