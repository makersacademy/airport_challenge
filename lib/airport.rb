require './lib/plane'

class Airport
  def initialize
    @plane = []
  end

  def land(plane)
    @plane.push(plane)
  end

  def take_off(plane)
    @plane.delete(plane)
    "#{plane} has departed the airport"
  end

  def has_space?
    @plane.length < 3
  end

end
