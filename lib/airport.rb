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
    plane.flying = false
    @planes[plane.flight_number] = plane
  end

  def take_off(flight_number)
    raise "Cannot take off in stormy weather" if stormy_weather?
    plane = @planes.delete(flight_number)
    plane.flying = true
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
end
