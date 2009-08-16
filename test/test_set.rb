require File.dirname(__FILE__) + "/test_helper"

class TestSet < Clojure::TestCase
  include Clojure

  def setup
    @set = Set.new([1, 2, 3])
  end

  def test_disj
    assert_equal Set.new([1, 3]), @set.disj(2)
    assert_equal @set, @set.disj(4)
  end

  def test_contains
    assert @set.contains?(2)
    assert !@set.contains?(4)
  end

  def test_get
    assert_equal 2, @set.get(2)
    assert_nil @set.get(4)
  end

  def test_map
    @set2 = @set.map {|x| x * 2 }
    assert @set2[2]
    assert @set2[4]
    assert @set2[6]
  end

  def test_to_a
    assert_equal [1, 2, 3], @set.to_a.sort
    assert_equal [], Set.new([]).to_a
  end
end
