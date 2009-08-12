require "clojure/clojure-1.0.0.jar"

module Clojure
  Map = Java::clojure::lang::IPersistentMap

  module Map
    def self.new(hash)
      hash.inject(Java::clojure::lang::PersistentArrayMap::EMPTY) do |map, pair|
        map.assoc(*pair)
      end
    end

    def [](key)
      RT.get(self, key)
    end

    def assoc(*pairs)
      raise "Need even number of key/value pairs" unless pairs.size % 2 == 0
      return self if pairs.empty?
      super(pairs[0], pairs[1]).assoc(*pairs[2 .. -1])
    end

    def dissoc(key)
      # TODO: support many args
      RT.dissoc(self, key)
    end

    def empty?
      isEmpty
    end

    def merge(other)
      other = Map.new(other) if other.is_a?(Hash)
      # TODO: support multiple args
      RT.conj(self, other)
    end

    def keys
      RT.keys(self)
    end

    def values
      RT.vals(self)
    end

    alias_method :length, :count
    alias_method :size, :count

    def has_key?
    end

    def each(&block)
    end
  end
end
