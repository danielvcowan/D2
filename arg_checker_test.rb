# arg_checker_test.rb

require 'minitest/autorun'
require_relative 'arg_checker'

class ArgCheckerTest < Minitest::Test
  
  # Test that a ArgChecker object is created
  def test_arg_checker_initialize
    refute_nil ArgChecker::new([1, 1, 1])
  end

  def setup
  	@args_array = ArgChecker::new([1, 1, 1])
  end

  def test_check_arg_count_pass
  	assert @args_array.check_arg_count
  end

  def test_check_arg_count_short
    @args_short = ArgChecker.new([1, 1])
    refute @args_short.check_arg_count
  end

  def test_check_arg_count_long
    @args_long = ArgChecker.new([1, 1, 1, 1])
    refute @args_long.check_arg_count
  end

  def test_check_arg_count_long
    @args_long = ArgChecker.new([1, 1, 1, 1])
    assert_equal @args_long.get_length, 4
  end

  def test_check_arg_count_empty
    @args_empty = ArgChecker.new([])
    assert_equal @args_empty.get_length, 0
  end

  def test_check_arg_kind_str
  	@args_str = ArgChecker.new(["string"])
    refute @args_str.check_arg_kind(0)
  end

  def test_check_arg_kind_strint
  	@args_strint = ArgChecker.new(["3b"])
    refute @args_strint.check_arg_kind(0)
  end

  def test_check_arg_kind_int
  	@args_int = ArgChecker.new(["4"])
    assert @args_int.check_arg_kind(0)
  end

  def test_check_arg_value_pass
  	@args_int = ArgChecker.new(["-0"])
  	assert @args_int.check_arg_value(0)
  end

  def test_check_arg_value_fail
  	@args_int = ArgChecker.new(["-9999999999"])
  	refute @args_int.check_arg_value(0)
  end

end