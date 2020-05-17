require './lib/plane'

class Airport
  def initialize
    @planes = []
  end

  def land(plane)
    raise "Cannot land, airport is full" unless @planes.length < 3

    @planes.push(plane)
  end

  def take_off(plane)
    @planes.delete(plane)
    "#{plane} has departed the airport"
  end

  def space?
    @planes.length < 3
  end

end
