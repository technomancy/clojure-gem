require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  Map = Java::clojure::lang::IPersistentMap

  module Map
    include Seq

    def self.new(hash)
      hash.inject(Java::clojure::lang::PersistentArrayMap::EMPTY) do |map, pair|
        map.assoc(*pair)
      end
    end

    def get(key)
      RT.get(self, key)
    end
    alias_method :[], :get

    def dissoc(key, *more)
      if more.empty?
        RT.dissoc(self, key)
      else
        RT.dissoc(self, key).dissoc(*more)
      end
    end

    def merge(other, *more)
      other = Map.new(other) if other.is_a?(Hash)
      if more.empty?
        RT.conj(self, other)
      else
        RT.conj(self.other).merge(*more)
      end
    end

    # These return an ArrayList; might as well be a Ruby array.
    def keys
      RT.keys(self).to_a
    end
    alias_method :indexes, :keys
    alias_method :indices, :keys

    def values
      RT.vals(self).to_a
    end
    alias_method :vals, :values

    # you know what would be awesome? composable functions!
    def each_key(&block)
      keys.each(&block)
    end

    def each_value(&block)
      value.each(&block)
    end

    def has_key?(key)
      RT.contains(self, key)
    end

    def to_hash
      inject({}) {|h, pair| h[pair.key] = pair.value; h }
    end

    def to_a
      super.map{|pair| pair.to_a }
    end
  end
end
