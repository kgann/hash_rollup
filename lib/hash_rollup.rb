module HashRollup
  def rollup(hash)
    dup = self.dup
    dup.merge(hash) do |key, old, new|
      dup[key] = [dup[key]].flatten << new
    end
    rolled_up = hash.merge dup
    rolled_up.each_pair{ |k, v| rolled_up[k] = yield(v, k) } if block_given?
    rolled_up
  end
end

class Hash
  include HashRollup
end