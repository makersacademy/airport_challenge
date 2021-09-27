require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  include Weather

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = {}
    @capacity = capacity
  end

  def planes
    @planes.keys
  end
  
  def land(plane)
    raise "Airport is full" if airport_full?
    raise "Cannot land a plane in stormy weather" if stormy_weather?
    raise "This plane has already landed" if plane_already_landed?(plane)
    plane.land
    @planes[plane.flight_number] = plane
  end

  def take_off(flight_number)
    raise "Cannot take off in stormy weather" if stormy_weather?
    raise "This airport does not have this flight number" if plane_already_flying?(flight_number)
    plane = @planes.delete(flight_number)
    plane.take_off
    plane
  end

  private

  def stormy_weather?
    Weather.generate_weather == "stormy"
  end

  def airport_full?
    @planes.count >= @capacity
  end

  def plane_already_landed?(plane)
    plane.status == "Landed"
  end

  def plane_already_flying?(flight_number)
    @planes[flight_number].nil? || @planes[flight_number].status == "Flying"
  end
end
