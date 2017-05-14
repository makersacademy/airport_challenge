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
    complete_landing_procedure(plane) unless landing_denied(plane)
  end

  def takeoff_plane(plane)
    complete_takeoff_procedure(plane) unless takeoff_denied(plane)
  end

  def check_hangar
    airport_empty? ? "Hangar is empty" : print_all_flight_nos
  end

  def stormy?
    weather.is_stormy
  end


  private

  def complete_landing_procedure(plane)
    plane.landed
    hangar << plane
    return_flight_status(plane, "landing")
  end

  def complete_takeoff_procedure(plane)
    plane.takeoff
    hangar.delete(plane)
    return_flight_status(plane, "taking off")
  end

  def landing_denied(plane)
    fail("Weather is too stormy for landing") if stormy?
    fail("That is not a plane, sorry!") unless is_plane(plane)
    fail("Plane is already landed") unless plane.airborne?
    fail("Airport is full!") if airport_full?
  end

  def takeoff_denied(plane)
    fail("Weather is too stormy for takeoff") if stormy?
    fail("Plane is already airborne") if plane.airborne?
    fail("Plane is not in hangar") unless plane_in_hangar(plane)
  end

  def return_flight_status(plane,action)
    action == "taking off" ? "#{print_flight_no(plane)} has taken off" : "#{print_flight_no(plane)} has completed landing"
  end

  def plane_in_hangar(plane)
    hangar.include?(plane)
  end

  def airport_full?
    hangar.count >= @capacity
  end

  def airport_empty?
    hangar.empty?
  end

  def is_plane(object)
    object.instance_of? Plane
  end

  def print_flight_no(plane)
    "Makers ##{plane.flight_number.to_s}"
  end

  def print_all_flight_nos
    @hangar.map {|plane| print_flight_no(plane) }
  end

end
