module HashRollup
  def rollup(hash)
    rolled_up = merge(hash) do |key, old_val, new_val|
      [old_val].flatten << new_val
    end
    rolled_up.each_pair{ |k, v| rolled_up[k] = yield(v, k) } if block_given?
    rolled_up
  end
end

class Hash
  include HashRollup
end