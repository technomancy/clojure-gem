require "clojure/clojure-1.0.0.jar"

module Clojure
  class List
    import Java::clojure::lang::PersistentList

    def initialize(array)
      @list = PersistentList::EMPTY
      array.size.times do |i|
        @list = @list.cons(array[-i])
      end
    end

    def clj
      @list
    end

    # TODO: pull a lot of this stuff out to a Seq module
    def first
      @list.first
    end

    def next
      @list.next
    end

    def rest
      RT.more(@list)
    end

    def seq
      RT.seq(@list)
    end

    def cons(o)
      @list.cons(o)
    end

    def size
      @list.count
    end

    def empty?
      size.zero?
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
