require_relative './plane'

class Airport
  DEFAULT_CAPACITY = 10  
  
  attr_accessor :airport_attributes
  
  def initialize(airport_id, capacity = DEFAULT_CAPACITY)
    @airport_attributes = {
      airport_id: airport_id,
      capacity: capacity,
      planes: []
    }
  end

  def land(plane)
    fail 'Plane not airborne' if plane.plane_attributes[:airport_id] != "IN TRANSIT/AIR"  

    fail 'Airport full' if full?

    fail 'Weather is stormy' if weather_now == "stormy"

    plane.plane_attributes[:airport_id] = @airport_attributes[:airport_id]
    @airport_attributes[:planes] << plane
  end

  def take_off(plane)
    fail 'Plane not present at this airport' unless @airport_attributes[:planes].include?(plane)
    
    fail 'Weather is stormy' if weather_now == "stormy"

    plane.plane_attributes[:airport_id] = "IN TRANSIT/AIR"
    @airport_attributes[:planes].delete(plane)
  end

  def full?
    @airport_attributes[:planes].count >= @airport_attributes[:capacity]
  end

  def weather_now
    possible_weather = ["clear", "clear", "clear", "clear", 
    "clear", "clear", "stormy"]
    possible_weather.sample
  end
end
