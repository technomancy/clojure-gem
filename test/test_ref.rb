require File.dirname(__FILE__) + "/test_helper"

class TestRef < Clojure::TestCase
  include Clojure

  def setup
    @ref = Ref.new(1)
  end

  def test_set
    Ref.dosync { @ref.set! 2 }
    assert_equal 2, @ref.deref
  end

  def test_alter
    Ref.dosync do
      @ref.alter{|v| v + 1}
    end
    assert_equal 2, @ref.deref

    inc = Proc.new {|v| v + 1 }
    Ref.dosync { @ref.alter(inc) }

    assert_equal 3, @ref.deref

    adder = Proc.new {|v, n| v + n }
    Ref.dosync { @ref.alter(adder, 2) }

    assert_equal 5, @ref.deref
  end

  def test_set_outside_transaction
    assert_raises(NativeException) do
      @ref.set! 2
    end
  end
end
