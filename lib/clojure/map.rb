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

    def [](key)
      RT.get(self, key)
    end

    def assoc(key, value, *more)
      if more.empty?
        super(key, value)
      else
        super(key, value).assoc(*more)
      end
    end

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

    def keys
      RT.keys(self).to_a
    end

    def values
      RT.vals(self).to_a
    end

    def has_key?(key)
      RT.contains(self, key)
    end

    def to_hash
      inject({}) {|h, pair| h[pair.key] = pair.value; h }
    end
  end

  # TODO: how to get my methods to override the Clojure ones?
  # Java::clojure::lang::PersistentArrayMap.send(:include, Map)
  # Java::clojure::lang::PersistentHashMap.send(:include, Map)
  # Java::clojure::lang::PersistentStructMap.send(:include, Map)
  # Java::clojure::lang::PersistentTreeMap.send(:include, Map)
end
