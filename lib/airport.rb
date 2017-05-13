class Airport

  attr_reader :weather
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    fail("Plane is already landed") unless plane.airborne?
    fail("Airport is full!") if airport_full?
    complete_landing_procedure(plane)
  end

  def takeoff_plane(plane)
    fail("Airport is empty!") if airport_empty? 
    fail("Plane is already airborne") if plane.airborne?
    complete_takeoff_procedure(plane)
  end

  def complete_landing_procedure(plane)
    plane.landed
    @hangar << plane
    return "#{plane} has completed landing"
  end

  def complete_takeoff_procedure(plane)
    plane.takeoff
    @hangar.delete(plane)
    return "#{plane} has taken off"
  end

  def stormy?
    weather.is_stormy
  end

  def airport_full?
    @hangar.count >= @capacity
  end

  def airport_empty?
    @hangar.empty?
  end

end
