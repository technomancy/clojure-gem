require "clojure/clojure-1.0.0.jar"
require "clojure/fn"
require "clojure/list"

module Clojure
  class Ref
    def initialize(val)
      @ref = Java::clojure::lang::Ref.new(val)
    end

    def deref
      @ref.deref
    end

    def set!(val)
      @ref.set(val)
    end

    def alter(*args, &block)
      if block.nil?
        fn = args.shift
        @ref.alter(fn.splat, List.new(args))
      else
        alter(*args.unshift(block))
      end
    end

    def commute(*args, &block)
      if block.nil?
        fn = args.shift
        @ref.commute(fn.splat, List.new(args))
      else
        commute(*args.unshift(block))
      end
    end

    def self.dosync(&block)
      Java::clojure::lang::LockingTransaction.runInTransaction(block)
    end
  end  
end
