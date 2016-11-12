require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def status(plane)
    return "Landed" if plane.landed == true
    return "In the air" if plane.landed == false
  end

  def land(plane)
    plane.land
    @planes << plane
  end

  def take_off(plane)
    plane.take_off
    remove_from_airport(plane)
  end

  private

  def remove_from_airport(plane)
    @planes.delete(plane)
  end

end
