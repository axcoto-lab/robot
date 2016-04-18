require_relative 'helper'

class Robot::MapTest < Minitest::Test
  def setup
    @map = Robot::Map.new 5, [[1,0], [2,2], [2,3]]
  end

  def test_out_of_bound
    assert_equal true, @map.out_of_bound?(-1, -1)
    assert_equal true, @map.out_of_bound?(1, 5)
    assert_equal true, @map.out_of_bound?(6, 2)
    assert_equal true, @map.out_of_bound?(3, 7)

    assert_equal false, @map.out_of_bound?(3, 3)
    assert_equal false, @map.out_of_bound?(3, 1)

  end
end
