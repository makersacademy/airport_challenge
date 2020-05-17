require './lib/plane'

class Airport
  def initialize
    @plane = []
  end

  def land(plane)
    raise "Cannot land, airport is full" unless @plane.length < 3

    @plane.push(plane)
  end

  def take_off(plane)
    @plane.delete(plane)
    "#{plane} has departed the airport"
  end

  def space?
    @plane.length < 3
  end

end
