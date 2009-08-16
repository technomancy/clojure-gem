require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  Vector = Java::clojure::lang::PersistentVector

  class Vector
    include Seq

    def self.new(array)
      create(array)
    end

    def [](index, to = nil)
      return nil if empty?
      to, index = [index.first, index.last] if index.is_a? Range

      if to # must be slicing
        slice(index, to)
      else
        if index >= 0
          RT.nth(self, index)
        else
          RT.nth(self, size + index)
        end
      end
    end

    def reverse
      r = Vector.new([])
      count.times { |i| r = r.conj(self[count - (i + 1)]) }
      return r
    end

    def last
      self[-1]
    end

    # TODO: slice, join, uniq, flatten
  end
end
