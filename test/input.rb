require_relative 'helper'

class Robot::InputTest < Minitest::Test
  def test_load_data
    input = Robot::Input.new "test/input.txt"
    assert_equal input.size, [5, 5]
    assert_equal input.position, [1, 2]
    assert_equal input.drive_path, 'NNESEESWNWW'.split('')
    assert_equal input.dirts, [[1,0], [2,2], [2,3]]
  end

  def test_load_invalid_data
    begin
      Robot::Input.new "test/invalid"
    rescue Exception => e
      assert_match "Error read file test/invalid", e.message
    end
  end
end
