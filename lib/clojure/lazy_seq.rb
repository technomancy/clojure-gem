require "clojure/clojure-1.0.0.jar"
require "clojure/seq"

module Clojure
  LazySeq = Java::clojure::lang::LazySeq

  class LazySeq
    include Seq
  end
end
