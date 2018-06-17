require_relative './plane.rb'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail "Plane already at airport" if in_hangar?(plane)
    @planes.push(plane)
  end

  def take_off(plane)
    fail "Plane not at airport" unless in_hangar?(plane)
    @planes.delete(plane)
    "#{plane} has left the airport"
  end

  def in_hangar?(plane)
    @planes.include?(plane)
  end

end
