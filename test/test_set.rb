require File.dirname(__FILE__) + "/test_helper"

class TestSet < Clojure::TestCase
  include Clojure

  def setup
    @set = Set.new([1, 2, 3])
    @set2 = Set.new([1, 2, 3, 4, 5])
    @set3 = Set.new([5, 6, 7])
    @empty = Set.new([])
  end

  def test_conj
    assert_equal @set2, @set.conj(5).conj(4)
    assert_equal @set, @set.conj(1)
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

  def test_intersection
    assert_equal @set, @set2.intersection(@set)
    assert_equal @set, @set.intersection(@set2)
    assert_equal @empty, @set.intersection(@empty) 
  end

  def test_union
    assert_equal Set.new([1, 2, 3, 5, 6, 7]), @set.union(@set3)
    assert_equal @set, @set.union(@empty)
  end

  def test_difference
    assert_equal @empty, @set.difference(@set2)
    assert_equal @set, @set.difference(@set3)
  end

  def test_subset
    assert @set.subset?(@set2)
    assert !@set2.subset?(@set)
    assert @empty.subset?(@set)
  end

  def test_superset
    assert @set2.superset?(@set)
    assert !@set.superset?(@set2)
    assert @set.superset?(@empty)
  end
end
