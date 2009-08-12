require "clojure/clojure-1.0.0.jar"
require "clojure/fn"
require "clojure/list"

module Clojure
  Ref = Java::clojure::lang::Ref

  class Ref
    alias_method :orig_alter, :alter
    alias_method :orig_commute, :commute

    def alter(*args, &block)
      if block.nil?
        fn = args.shift
        orig_alter(fn.splat, List.new(args))
      else
        alter(*args.unshift(block))
      end
    end

    def commute(*args, &block)
      if block.nil?
        fn = args.shift
        orig_commute(fn.splat, List.new(args))
      else
        commute(*args.unshift(block))
      end
    end

    def self.dosync(&block)
      Java::clojure::lang::LockingTransaction.runInTransaction(block)
    end
  end  
end
