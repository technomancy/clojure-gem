require File.dirname(__FILE__) + "/test_helper"

class TestVector < Clojure::TestCase
  include Clojure

  def setup
    @vector = Vector.new([1])
    @vector2 = @vector.conj(2)
    @vector3 = @vector2.conj(3)
  end

  def test_single_element
    assert_equal 1, @vector.first
    assert_equal 1, @vector.size
    assert_nil @vector.next
    assert @vector.rest.empty?
    assert_equal "[1]", @vector.inspect
  end

  def test_multi_element
    assert_equal 2, @vector2.next.first
    assert_equal 1, @vector2.first
    assert_equal 2, @vector2.size
    assert_equal "[1 2]", @vector2.inspect
  end

  def test_lookup
    assert_equal 3, @vector3[2]
    assert_equal 3, @vector3[-1]
    assert_equal 3, @vector3.last
    assert_equal 1, @vector.last
    assert_nil Vector.new([]).last
    assert_equal @vector3, @vector3[0, 3]
    assert_equal @vector, @vector3[0, 1]
    assert @vector[1, 1].empty?
  end

  def test_reverse
    assert_equal Vector.new([3, 2, 1]), @vector3.reverse
    assert_equal @vector, @vector.reverse
  end

  def test_join
    assert_equal "1, 2, 3", @vector3.join(", ")
  end

  def test_uniq
    assert_equal @vector3, @vector3.conj(2).uniq
    assert_equal Vector.new([1]), Vector.new([1] * 9).uniq
    assert_equal @vector3, @vector3.uniq
  end

  def test_flatten
    assert_equal(Vector.new([1, 1, 2]),
                 Vector.new([@vector, @vector2]).flatten)
    assert_equal(Vector.new([1, 1, 2, 1, 2, 3]),
                 Vector.new([@vector, @vector2,
                             Vector.new([@vector3])]).flatten)
    assert_equal @vector3, @vector3.flatten
  end

  def test_compact
    assert Vector.new([nil]).compact.empty?
    assert_equal Vector.new([1, 2]), Vector.new([1, nil, 2, nil]).compact
  end

  def test_concat
    assert_equal Vector.new([1, 1, 2, 3]), @vector.concat(@vector3)
    assert_equal @vector, @vector.concat(Vector.new([]))
  end

  def test_map
    assert_equal([2, 3, 4], @vector3.map {|x| x + 1})
  end

  def test_to_a
    assert_equal [1, 2, 3], @vector3.to_a
  end
end
