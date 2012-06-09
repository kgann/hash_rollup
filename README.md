# Hash Rollup

### Ruby Hash Extension
-----------------------

Provides a way to merge two hashes and retain all values that belonged to duplicate keys

Think of it as a 'soft' merge

Example

    hash   = { :one => 1, :two => 2, :three => 3 }
    hash_2 = { :one => 1, :two => 2, :four => 4 }
    hash.rollup hash_2
    # { :one => [1,1], :two => [2,2], :three => 3, :four => 4 }

Optionally, you can provide a block and alter the rolled up values - just a custom map method really!

    hash.rollup hash_2 do |val, key|
      val.is_a?(Array) ? val.map{ |x| x * 2 } : val * 2
    end
    # { :one => [2,2], :two => [4,4], :three => 6, :four => 8 }
