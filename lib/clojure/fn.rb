require "clojure/clojure-1.0.0.jar"

class Proc
  def splat
    p = self
    Proc.new {|args| p.call(*args)}
  end
end

