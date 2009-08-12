require "clojure/clojure-1.0.0.jar"

module Clojure
  List = Java::clojure::lang::PersistentList

  class List
    def self.new(array)
      list = EMPTY
      array.size.times do |i|
        list = list.cons(array[-i])
      end
      return list
    end

    alias_method :inspect, :to_string
    alias_method :size, :count
    alias_method :conj, :cons

    def rest
      RT.more(self)
    end

    def empty?
      count.zero?
    end

    include Enumerable

    def each(&block)
      return if empty?
      yield first
      rest.each(&block)
    end

    def <=>(other)
      Java::clojure::lang::Util.compare(clj, other.clj)
    end
  end
end
