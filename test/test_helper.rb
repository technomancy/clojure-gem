$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require "rubygems"
require "minitest/unit"
require 'minitest/autorun'
require "clojure"

class Clojure::TestCase < MiniTest::Unit::TestCase
  include Clojure

  IDENTITY = Proc.new{|x| x}
  INC = Proc.new{|x| x + 1}
end

