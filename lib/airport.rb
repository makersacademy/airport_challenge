require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 3

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def land(plane)
    raise "Cannot land, airport is full" unless space?

    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    "#{plane} has departed the airport"
  end

  def space?
    @planes.length < DEFAULT_CAPACITY
  end

  attr_reader :capacity

end
