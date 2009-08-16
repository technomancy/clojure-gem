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

    def ==(other)
      Java::clojure::lang::Util.equiv(self, other)
    end

    include Enumerable

    def each(&block)
      return if empty?
      yield first
      rest.each(&block)
    end

    # TODO: fix ClassCast problems to get lazy sequences working
    # Do we want lazy versions of map/select as well as class-preserving?

    # def map(&block)
    #   Clojure.var("map").invoke(Fn.from_proc(block), self)
    # end
    # alias_method :collect, :map

    # def select(proc = nil, &block)
    #   Clojure.var("filter").invoke(block, self)
    # end
    # alias_method :find_all, :select

    # def reject(proc = nil, &block)
    #   select { |*args| not block.call(&args) }
    # end

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
