class Airport

  attr_reader :weather

  def initialize
    @weather = Weather.new
    @capacity = 1
  end

  def land_plane(plane)
    fail("Plane is already landed") unless plane.airborne?
    fail("Airport is full!") if @capacity == 0
    complete_landing_procedure(plane)
  end

  def takeoff_plane(plane)
    fail("Plane is already landed") if plane.airborne?
    complete_takeoff_procedure(plane)
  end

  def complete_landing_procedure(plane)
    plane.landed
    @capacity -= 1
    return "#{plane} has completed landing"
  end

  def complete_takeoff_procedure(plane)
    plane.takeoff
    @capacity += 1
    return "#{plane} has taken off"
  end

  def stormy?
    weather.is_stormy
  end

end
