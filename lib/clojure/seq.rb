module Clojure
  module Seq
    def empty?
      isEmpty
    end

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

    # TODO: some dumb module feature can reduce these to aliases
    def inspect
      toString
    end

    def size
      count
    end

    def length
      count
    end

    include Enumerable

    def each(&block)
      return if empty?
      yield first
      rest.each(&block)
    end

    # TODO: most enumerable methods should return clojure data
    # structures rather than (yuck!) arrays.

    def <=>(other)
      Java::clojure::lang::Util.compare(clj, other.clj)
    end

    # def to_a
    #   a = []
    #   each {|x| a << x}
    #   return a
    # end
  end
end
