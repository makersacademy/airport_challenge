require "./lib/class_plane"
require "./lib/class_airport"

# this class enables the creation of a "world" for the
# software_airport solution to work with
# the intention is to create the ability to generate "scenarios" to
# optimise functional and unit based testing, as well as potential
# user training.

class World
  DEFAULT_AIRPORTS = 10
  DEFAULT_PLANES = 20

  def initialize
    @airports = DEFAULT_AIRPORTS
    @planes = DEFAULT_PLANES
  end

  def airports
    if scenario_setup?
      @airports
    else
      Airport.list_all_airports
    end
  end

  def airports=(update)
    if scenario_setup?
      @airports = update
    else
      puts "World scenario created - use 'controller software' to change airports"
      false
    end
  end

  def planes
    if scenario_setup?
      @planes
    else
      Plane.list_all_planes
    end
  end

  def planes=(update)
    if scenario_setup?
      @planes = update
    else
      puts "World scenario created - use 'controller software' to change planes"
      false
    end
  end

  def default
    scenario00
  end

  def scenario_setup?
    Airport.list_all_airports.count.zero?
  end

  private
  def scenario00
    @airports.times { Airport.new }
    @planes.times { Plane.new }
  end
end
