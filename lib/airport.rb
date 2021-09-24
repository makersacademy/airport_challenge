require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = {}
    @capacity = capacity
  end

  def planes
    @planes.keys
  end
  
  def land(plane)
    raise "Airport is full" if @planes.count >= @capacity
    raise "Cannot land a plane in stormy weather" if Weather.generate_weather == "stormy"
    raise "This plane has already landed" if plane.status == "Landed"
    plane.flying = false
    @planes[plane.flight_number] = plane
  end

  def take_off(flight_number)
    raise "Cannot take off in stormy weather" if Weather.generate_weather == "stormy"
    
    plane = @planes.delete(flight_number)
    plane.flying = true
    plane
  end

  private
  include Weather
end
