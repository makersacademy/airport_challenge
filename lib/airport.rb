require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    raise 'No space for landing' if full?
    if plane.flying? == true
      plane.land
      planes << plane
    else
      "Not an airborne plane."
    end
  end

  def take_off(plane)
    if plane.flying? == false || planes.include?(plane)
      plane = planes.pop
      plane.take_off
    end
  end

  private

  def full?
    planes.size == 2
  end

end