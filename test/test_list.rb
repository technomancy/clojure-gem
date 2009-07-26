require File.dirname(__FILE__) + "/test_helper"

class TestList < Clojure::TestCase
  include Clojure
  def test_single_element
    @list = List.new([1])
    assert_equal 1, @list.first
    assert_equal 1, @list.size
    assert_nil @list.next
    assert @list.rest.empty?
  end
end
