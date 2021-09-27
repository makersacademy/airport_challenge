require 'weather'
$weather = Weather.new

class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity

  def initialize(airport_id, capacity = DEFAULT_CAPACITY)
    @airport_id = airport_id
    @planes = []
    @capacity = capacity
  end
  
  def full?
    @planes.length >= @capacity
  end

  def land(plane)
    raise "Plane already at this airport" if confirm_departure(plane) == "Plane has not departed"
    raise "Plane already at another airport" unless plane.current_airport.zero?
    raise "Dangerous weather" if $weather.stormy
    raise "Airport full" if full?
    @planes << plane
    plane.update_airport(@airport_id)
  end

  def take_off(plane)
    raise "Plane is already in the sky" if plane.current_airport.zero?
    raise "Plane is at another airport" if confirm_departure(plane) == "Plane has departed"
    raise "Dangerous weather" if $weather.stormy
    @planes.delete(plane)
    plane.update_airport(0)
  end

  def confirm_departure(plane)
    plane.current_airport == @airport_id ? "Plane has not departed" : "Plane has departed"
  end
end
