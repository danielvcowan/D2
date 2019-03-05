# Daniel Cowan
require_relative 'mines'
require_relative 'map'

class Prospector

  attr_accessor :id, :num_turns, :turn, :ruby_count, :fake_ruby_count
  attr_accessor :rubies_found, :fake_rubies_found, :days, :ruby_string, :fake_ruby_string

  def initialize(id, num_turns)
    @id = id
    @num_turns = num_turns
    @turn = 0
    @ruby_count = 0
    @fake_ruby_count = 0
    @rubies_found = 0
    @fake_rubies_found = 0
    @days = 0
    @ruby_string = ""
    @fake_ruby_string = ""
  end

  def find_rubies(max_rub, max_frub)
    @rubies_found = rand(max_rub + 1)
    @fake_rubies_found = rand(max_frub + 1)
    return @rubies_found, @fake_rubies_found
  end

  def add_to_count
    @ruby_count += @rubies_found
    @fake_ruby_count += @fake_rubies_found
  end

  def increment_turns
    @turn += 1
  end

  def move?
    found_today = @rubies_found + @fake_rubies_found
    if found_today <= 0
      true
    end
  end

  def plural?
    if @rubies_found == 1
      @ruby_string = "ruby"
    else
      @ruby_string = "rubies"
    end

    if @fake_rubies_found == 1
      @fake_ruby_string = "ruby"
    else
      @fake_ruby_string = "rubies"
    end
  end

  def display_day(mine_name)
    if @rubies_found > 0 && @fake_rubies_found > 0
      puts "\tFound %d %s and %d fake %s in %s." % [@rubies_found, @ruby_string, @fake_rubies_found, @fake_ruby_string, mine_name]
    elsif @rubies_found > 0
      puts "\tFound %d %s in %s." % [@rubies_found, @ruby_string, mine_name]
    elsif @fake_rubies_found > 0
      puts "\tFound %d fake %s in %s." % [@fake_rubies_found, @fake_ruby_string, mine_name]
    else
      puts "\tFound no rubies or fake rubies in %s." % [mine_name]
    end
  end

  def tally_day
    @days += 1
  end

  def display_trip
    puts "After %d days, Rubyist %d found:" % [@days, @id]
    plural?
    puts "\t%d %s." % [@ruby_count, @ruby_string]
    puts "\t%d %s." % [@fake_ruby_count, @fake_ruby_string]
  end

  def check_turns(old_town, mine_name)
  	unless @turn == @num_turns
      puts 'Heading from ' + old_town + ' to ' + mine_name + '.'
      true
    else
      false
    end
  end

  def going_home_how?
    if @ruby_count >= 10
      puts "Going home victorious!"
    elsif @ruby_count >= 1 && @ruby_count <= 9
      puts "Going home sad."
    else
      puts "Going home empty-handed."
    end
  end
end  