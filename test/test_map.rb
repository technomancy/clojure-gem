require File.dirname(__FILE__) + "/test_helper"

class TestMap < Clojure::TestCase
  include Clojure

  def setup
    @map = Map.new({1 => "one", 2 => "two"})
  end

  def test_get
    assert_equal "one", @map[1]
    assert_equal "two", @map[2]
    assert_nil @map[3]
  end

  def test_assoc
    assert_equal "three", @map.assoc(3, "three")[3]
    assert_equal "four", @map.assoc(3, "three", 4, "four")[4]
  end

  def test_dissoc
    assert_nil @map.dissoc(2)[2]
    assert_nil @map.dissoc(3,2)[2]
  end

  def test_empty?
    assert Map.new({}).empty?
  end

  def test_merge
    assert_equal "three", @map.merge(Map.new({3 => "three"}))[3]
  end

  def test_keys
    assert_equal [1, 2], @map.keys.sort
  end

  def test_values
    assert_equal ["one", "two"], @map.values.sort
  end

  def test_size
    assert_equal 2, @map.size
  end

  def test_has_key?
    assert @map.has_key?(1)
    assert ! @map.has_key?(3)
  end

  def test_each
  end
end
