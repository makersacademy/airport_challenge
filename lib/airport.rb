require './lib/plane'
require './lib/weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 3

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land, airport is full" unless space?

    @planes.push(plane)
  end

  def take_off(plane)
    #need to add a clause to prevent take_off with no plane at the airport
    @planes.delete(plane)
    "#{plane} has departed the airport"
  end

  def space?
    @planes.length < @capacity
  end

  attr_reader :capacity

end
