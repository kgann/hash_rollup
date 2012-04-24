module Rollup
  def rollup(hash)
    rolled_up = reduce({}) do |new_hash, tuple|
      key, value = tuple
      new_hash[key] = hash[key] ? [hash[key]].flatten << value : value
      new_hash
    end
    rolled_up = hash.merge(rolled_up)
    rolled_up.each_pair{ |key, value| yield value, key } if block_given?
    rolled_up
  end
end

class Hash
  include Rollup
end