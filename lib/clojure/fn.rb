require "clojure/clojure-1.0.0.jar"

module Clojure
  class Fn
  end
end

class Proc
  def splat
    p = self
    Proc.new {|args| p.call(*args)}
  end
end

