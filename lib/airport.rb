require_relative 'plane'

class Airport
  attr_reader :plane
  def initialize
    @planes = []
  end

  def land(plane)
    @planes.push(plane)
  end

  def take_off(_)
    @planes.pop
  end

  def took_off(_)
    return "The plane took off"
  end
end
