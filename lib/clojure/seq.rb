module Clojure
  module Seq
    def first
      RT.first(self)
    end

    def rest
      RT.more(self)
    end

    def next
      RT.next(self)
    end

    def conj(obj)
      RT.conj(self, obj)
    end

    def inspect
      toString
    end

    def size
      count
    end

    def length
      count
    end

    def empty?
      isEmpty
    end

    include Enumerable

    def each(&block)
      return if empty?
      yield first
      rest.each(&block)
    end

    def select(&block)
      Clojure.var("filter").call(block, self)
    end
    alias_method :find_all, :select

    def map(&block)
      Clojure.var("map").call(block, self)
    end
    alias_method :collect, :map

    def reject(&block)
      select { |*args| not block.call(&args) }
    end

    def <=>(other)
      Java::clojure::lang::Util.compare(clj, other.clj)
    end

    def to_a
      a = []
      each {|x| a << x}
      return a
    end
  end
end
