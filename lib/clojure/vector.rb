require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  Vector = Java::clojure::lang::PersistentVector

  class Vector
    include Seq

    def self.new(array)
      create(array)
    end

    def [](index, length = nil)
      return nil if empty?

      if index.is_a? Range
        length = index.last - index.first
        index = index.first
      end

      if length
        Vector.new(to_a[index, length])
      else
        if index >= 0
          RT.nth(self, index)
        else
          RT.nth(self, index + size)
        end
      end
    end
    alias_method :slice, :[]
    alias_method :at, :[]

    def reverse
      r = Vector.new([])
      count.times { |i| r = r.conj(self[count - (i + 1)]) }
      return r
    end

    def last
      self[-1]
    end

    def join(str = "")
      rest.inject(first.to_s) {|s, x| s + str + x.to_s }
    end

    def uniq
      set = Set.new([])
      new = Vector.new([])
      each do |x|
        if !set.contains? x
          new = new.conj(x)
          set = set.conj(x)
        end
      end
      new
    end

    def flatten
      inject(EMPTY) do |acc, x|
        if x.is_a? Seq
          acc.concat(x.respond_to?(:flatten) ? x.flatten : x)
        else
          acc.conj(x)
        end
      end
    end

    def compact
      Vector.new(select{|x| !x.nil? })
    end

    def concat(other)
      new = EMPTY
      each {|x| new = new.conj(x) }
      other.each {|x| new = new.conj(x) }
      new
    end
    alias_method :+, :concat
  end
end
