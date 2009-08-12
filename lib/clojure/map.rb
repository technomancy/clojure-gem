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
      super(pairs[0], pairs[1]).assoc(pairs[2 .. -1])
    end

    def dissoc(*keys)
    end

    def empty?
    end

    def merge
    end

    def keys
    end

    def values
    end

    alias_method :length, :count
    alias_method :size, :count

    def has_key?
    end

    def each(&block)
    end
  end
end
