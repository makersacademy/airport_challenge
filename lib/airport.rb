require 'weather'

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity, :airport_id

  def initialize(airport_id, capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @airport_id = airport_id
    @planes = []
    @capacity = capacity
    @weather = weather
  end
  
  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    raise "Plane already at this airport" unless departed?(plane)
    raise "Plane already at another airport" unless plane.in_flight?
    raise "Dangerous weather" if @weather.stormy
    raise "Airport full" if full?
    @planes << plane
    plane.current_airport = @airport_id
  end

  def take_off(plane)
    raise "Plane is already in the sky" if plane.in_flight?
    raise "Plane is at another airport" if departed?(plane)
    raise "Dangerous weather" if @weather.stormy
    @planes.delete(plane)
    plane.current_airport = nil
  end

  def departed?(plane)
    plane.current_airport != @airport_id
  end

  def confirm_departure(plane)
    departed?(plane) ? "Plane has departed" : "Plane has not departed"
  end
end
