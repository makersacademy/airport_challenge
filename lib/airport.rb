require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'No space for landing' if full?
    if plane.flying == true
      plane.land
      planes << plane
    else
      "Not an airborne plane."
    end
  end

  def take_off(plane)
    if plane.flying == false || planes.include?(plane)
      plane = planes.pop
      plane.take_off
    else
      "Plane not in airport"
    end
  end

  private

  def full?
    planes.size == 3
  end

end