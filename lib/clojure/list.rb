require "clojure/clojure-1.0.0.jar"

module Clojure
  class List
    def self.proxy(obj)
      return nil if obj.nil?
      list = self.allocate
      list.list = obj
      list
    end

    attr_accessor :list

    def initialize(array)
      @list = Java::clojure::lang::PersistentList::EMPTY
      array.size.times do |i|
        @list = @list.cons(array[-i])
      end
    end

    def clj
      @list
    end

    def inspect
      @list.to_string
    end

    def cons(o)
      List.proxy(@list.cons(o))
    end

    alias_method :conj, :cons

    # TODO: pull a lot of this stuff out to a Seq module
    def first
      @list.first
    end

    def next
      List.proxy(@list.next)
    end

    def rest
      List.proxy(RT.more(@list))
    end

    def seq
      # Seq.proxy(RT.seq(@list))
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
