require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  List = Java::clojure::lang::PersistentList

  class List
    include Seq

    def self.new(array)
      list = EMPTY
      array.size.times do |i|
        list = list.cons(array[-i])
      end
      return list
    end
  end
end
