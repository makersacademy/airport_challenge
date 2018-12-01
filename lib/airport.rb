require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise 'Plane already landed' if plane.landed == true
    plane.landed = true
    hangar << plane
  end

  def take_off(plane)
    raise 'Plane already flying' if plane.landed == false
    plane.landed = false
    hangar.delete(plane)
  end

  def in_airport?(plane)
    hangar.include?(plane)
  end

end

# def hangar
#   @hangar
# end
