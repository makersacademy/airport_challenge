class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @plane_array = []
  end

  def takeoff(plane, weather)
    fail 'Sorry - this plane is not at the airport' unless 
    plane_array.include?(plane)
    
    fail 'Sorry - poor weather' unless weather.set_weather

    plane.has_landed = false
    plane_array.delete(plane)
  end

  attr_reader :plane_array
  attr_reader :capacity
end
