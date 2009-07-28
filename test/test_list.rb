require File.dirname(__FILE__) + "/test_helper"

class TestList < Clojure::TestCase
  include Clojure

  def setup
    @list = List.new([1])
    @list2 = @list.conj(2)
    @list3 = @list2.conj(3)
  end

  def test_single_element
    assert_equal 1, @list.first
    assert_equal 1, @list.size
    assert_nil @list.next
    assert @list.rest.empty?
    assert_equal "(1)", @list.inspect
  end

  def test_multi_element
    assert_equal 1, @list2.next.first
    assert_equal 2, @list2.first
    assert_equal 2, @list2.size
    assert_equal "(2 1)", @list2.inspect
  end

  def test_map
    # TODO: this should return a list
    assert_equal [4, 3, 2], @list3.map {|x| x + 1}
  end
end
