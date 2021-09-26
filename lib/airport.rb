class Airport
  DEFAULT_CAPACITY = 50
  attr_reader :planes, :capacity

  def initialize(airport_id, capacity = DEFAULT_CAPACITY)
    @airport_id = airport_id
    @planes = []
    @capacity = capacity
  end
  
  def take_off(plane, weather = Weather.new)
    raise "Plane is already in the sky" if plane.current_airport.zero?
    raise "Plane is at a different airport" if plane.current_airport != @airport_id
    raise "Plane is not at this airport" if confirm_departure(plane) == "Plane has departed"
    raise "Dangerous weather" if weather.stormy
    @planes.delete(plane)
    plane.current_airport = 0
  end

  def confirm_departure(plane)
    @planes.include?(plane) ? "Plane has not departed" : "Plane has departed"
  end

  def land(plane, weather = Weather.new)
    raise "Plane already at this airport" if plane.current_airport == @airport_id
    raise "Plane already at another airport" if plane.current_airport != 0
    raise "Dangerous weather" if weather.stormy
    raise "Airport full" if @planes.length == @capacity
    @planes << plane
    plane.current_airport = @airport_id
  end
end
