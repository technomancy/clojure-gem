require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  Set = Java::clojure::lang::IPersistentSet
  module Set
    include Seq

    def self.new(contents)
      set = Java::clojure::lang::PersistentHashSet::EMPTY
      contents.each {|x| set = set.conj(x) }
      return set
    end

    def disj(x)
      disjoin(x)
    end

    def get(key)
      RT.get(self, key)
    end
    alias_method :[], :get

    def has_key?(key)
      RT.contains(self, key)
    end
    alias_method :contains?, :has_key?

    def map(&block)
      set = Java::clojure::lang::PersistentHashSet::EMPTY
      each {|x| set = set.conj(block.call(x)) }
      return set
    end

    def intersection(other)
      Set.new(select{|x| other.contains?(x) })
    end

    def union(other)
      new = self
      other.each {|x| new = new.conj(x) }
      new
    end

    def difference(other)
      new = self
      other.each {|x| new = new.disj(x) }
      new
    end

    def subset?(other)
      all? {|x| other.contains?(x) }
    end

    def superset?(other)
      other.subset?(self)
    end
  end
end
