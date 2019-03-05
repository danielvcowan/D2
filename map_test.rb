# map_test

require 'minitest/autorun'
require_relative 'map'

class MapTest < Minitest::Test

  # Test that a Map object is created
  def test_map_initialize
    refute_nil Mines::new('test_mine', 7, 1, 1, [0, 1])
  end

end