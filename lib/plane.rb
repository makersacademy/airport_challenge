require_relative 'weather'
require_relative 'airport'

class Plane

  def landing
    airport.land(Plane.new)
  end

  def takeoff
  end

  def left_airport?
    true
  end
end
