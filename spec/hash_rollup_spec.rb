require 'spec_helper'

describe Hash do

  before :each do
    @hash   = { :one => 1, :two => 2, :three => 3 }
    @hash_2 = { :one => 1, :two => 2, :four => 4 }
    @rolled_up = { :one => [1,1], :two => [2,2], :three => 3, :four => 4 }
  end

  it "should respond to the instance method 'rollup'" do
    @hash.should respond_to :rollup
  end

  describe "#rollup" do
    it "should require one argument" do
      lambda{ @hash.rollup }.should raise_exception ArgumentError
    end

    it "should rollup all duplicte keys values into an array" do
      @hash.rollup(@hash_2).should eql @rolled_up
    end

   it "should yield the value and key of each tuple in the hash" do
     doubled_hash = { :one => [2,2], :two => [4,4], :three => 6, :four => 8 }
     new_hash = @hash.rollup(@hash_2) do |value, key|
       value.is_a?(Array) ? value.map{ |x| x * 2 } : value * 2
     end
     new_hash.should eql doubled_hash
   end

  end
end