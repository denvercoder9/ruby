"""
Small helper module because I kept schlepping around the rather big
activerecord gem just for the deep_symbolize_keys! method.

"""

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
end
