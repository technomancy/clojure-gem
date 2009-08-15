require "clojure/list.rb"
require "clojure/vector.rb"
require "clojure/map.rb"
require "clojure/set.rb"
require "clojure/lazy_seq.rb"

require "clojure/ref.rb"

module Clojure
  RT = Java::clojure::lang::RT
  VERSION = "0.0.1"

  def self.var(name, ns = "clojure.core")
    RT.var(ns, name)
  end
end
