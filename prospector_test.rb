# prospector_test.rb

require 'minitest/autorun'
require_relative 'prospector'

class ProspectorTest < Minitest::Test

  # Test that a Prospector object is created
  # STUBBING METHOD
  def test_prospector_initialize

    refute_nil Prospector::new(1, 1)
  end

  def setup
    @test_p = Prospector.new(1, 1)
  end

  # test find rubies

  # Test add_to_count method for rubies
  def test_add_to_count
    @test_p.rubies_found = 2
    @test_p.ruby_count = 3
    @test_p.add_to_count
    assert_equal @test_p.ruby_count, 5
  end

  # Test add_to_count method for fake rubies
  def test_add_to_count
    @test_p.fake_rubies_found = 2
    @test_p.fake_ruby_count = 3
    @test_p.add_to_count
    assert_equal @test_p.fake_ruby_count, 5
  end

  def test_increment_turns
    @test_p.turn = 1
    @test_p.increment_turns
    assert_equal @test_p.turn, 2
  end

  def test_tally_day
    @test_p.days = 1
    @test_p.tally_day
    assert_equal @test_p.days, 2
  end

  def test_move?
    @test_p.rubies_found = 0
    @test_p.fake_rubies_found = 0
    assert @test_p.move?
  end

  def test_move?
    @test_p.rubies_found = 1
    @test_p.fake_rubies_found = 0
    refute @test_p.move?
  end

  def test_move?
    @test_p.rubies_found = -1
    @test_p.fake_rubies_found = 0
    assert @test_p.move?
  end

  def test_find_rubies
    return_length = @test_p.find_rubies(2,3).length
    assert_equal return_length, 2
  end

  def test_plural_ruby
    @test_p.rubies_found = 1
    @test_p.plural?
    assert_equal @test_p.ruby_string, "ruby"
  end

  def test_plural_rubies
    @test_p.rubies_found = 0
    @test_p.plural?
    assert_equal @test_p.ruby_string, "rubies"
  end

  def test_plural_fake_ruby
    @test_p.fake_rubies_found = 1
    @test_p.plural?
    assert_equal @test_p.fake_ruby_string, "ruby"
  end

  def test_plural_fake_rubies
    @test_p.fake_rubies_found = 0
    @test_p.plural?
    assert_equal @test_p.fake_ruby_string, "rubies"
  end

end