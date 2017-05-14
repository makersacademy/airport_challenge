class Airport

  attr_reader :weather, :hangar
  attr_accessor :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = Weather.new
    @capacity = capacity
    @hangar = []
  end

  def land_plane(plane)
    landing_check(plane)
    complete_landing_procedure(plane)
  end

  def takeoff_plane(plane)
    takeoff_check(plane)
    complete_takeoff_procedure(plane)
  end

  def complete_landing_procedure(plane)
    plane.landed
    hangar << plane
    return_flight_status(plane,"landing")
  end

  def complete_takeoff_procedure(plane)
    plane.takeoff
    hangar.delete(plane)
    return_flight_status(plane,"taking off")
  end

  def stormy?
    weather.is_stormy
  end


  private

  def landing_check(plane)
    fail("That is not a plane, sorry!") unless is_plane(plane)
    fail("Weather is too stormy for landing") if stormy?
    fail("Plane is already landed") unless plane.airborne?
    fail("Airport is full!") if airport_full?
  end

  def takeoff_check(plane)
    fail("Plane is already airborne") if plane.airborne?
    fail("#{plane} is not in hangar") unless plane_in_hangar(plane)
    fail("Weather is too stormy for takeoff") if stormy?
  end

  def return_flight_status(plane,flight_action)
    flight_action == "taking off" ? "#{plane} has taken off" : "#{plane} has completed landing"
  end

  def plane_in_hangar(plane)
    hangar.include?(plane)
  end

  def airport_full?
    hangar.count >= @capacity
  end

  def is_plane(object)
    object.instance_of? Plane
  end

end
