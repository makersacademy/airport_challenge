class Airport

  attr_reader :weather

  def initialize
    @weather = Weather.new
  end

  def land_plane(plane)
    fail("Plane is already landed") unless plane.airborne?
    plane.landed
    return "#{plane} has completed landing"
  end

  def takeoff_plane(plane)
    fail("Plane is already landed") if plane.airborne?
    plane.takeoff
    return "#{plane} has taken off"
  end

  def stormy?
    weather.is_stormy
  end

end
