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

    # TODO: flatten, join, last, reverse, slice, uniq, to_a
  end
end
