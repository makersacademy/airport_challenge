require 'weather'
class Airport

  attr_reader :plane_left
  DefaultCapacity = 1

  def initialize (cap = DefaultCapacity)
    @capacity = cap
    @planes_landed = []
    
  end

  def land_at_airport(plane)
    raise "Airport full" if at_capacity?
    raise "Weather is too stormy to land" if weather_stormy?
    @planes_landed.push(plane)
    "Please land at the airport"
  end

  def take_off(plane)
    raise "Weather is too stormy to take off" if weather_stormy?
    @plane_left = true
    "Please take off from this airport"
  end

  def weather_check(weather)
    @weather_type = weather
  end
  
  private
  attr_reader :weather_type

  def at_capacity?
    @planes_landed.length >= @capacity
  end
  
  def weather_stormy?
    @weather_type == 'Stormy'
  end
    
end 




