require './lib/plane'

class Airport
  DEFAULT_CAPACITY = 3

  def initialize
    @planes = []
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

end
