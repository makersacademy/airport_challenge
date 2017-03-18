require_relative 'plane'

class Airport
attr_reader :planes

  def initialize
    @planes = []
  end

  def plane_land(plane)
    fail if stormy?
    fail if full?
    @planes << plane
    confirmation_land
  end

  def plane_takeoff
    fail if stormy?
    @planes.pop
    confirmation_takeoff
  end

  def confirmation_land
    "A plane has landed"
  end

  def confirmation_takeoff
    "Plane has taken off"
  end

  def stormy?
    [false, false, false, true].sample
  end

  def full?
    true if @planes.count > 100
  end

end
