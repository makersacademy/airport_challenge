class FlightLandingError < StandardError; end
class FlightTakeoffError < StandardError; end

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
    return_flight_status(plane, "land")
  end

  def complete_takeoff_procedure(plane)
    plane.takeoff
    hangar.delete(plane)
    return_flight_status(plane, "take off")
  end

  def landing_denied(plane)
    raise(FlightLandingError, "No landing when stormy") if stormy?
    raise(FlightLandingError, "Plane has already been landed") unless plane.airborne?
    raise(FlightLandingError, "Airport is full") if airport_full?
  end

  def takeoff_denied(plane)
    raise(FlightTakeoffError, "No takeoff when stormy") if stormy?
    raise(FlightTakeoffError, "Plane is already airborne") if plane.airborne?
    raise(FlightTakeoffError, "Plane is not in hangar") unless plane_in_hangar(plane)
  end

  def return_flight_status(plane, action)
    action == "land" ? "Landed: #{print_flight_no(plane)}" : "Taken off: #{print_flight_no(plane)}"
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

  def print_flight_no(plane)
    "Makers ##{plane.flight_number}"
  end

  def print_all_flight_nos
    @hangar.map { |plane| print_flight_no(plane) }
  end

end
