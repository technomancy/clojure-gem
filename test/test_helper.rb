$LOAD_PATH << File.dirname(__FILE__) + "/../lib"

require "rubygems"
require "minitest/unit"
require 'minitest/autorun'
require "clojure"

class Clojure::TestCase < MiniTest::Unit::TestCase
  include Clojure
end

