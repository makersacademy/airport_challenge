class Plane
  attr_reader :grounded

  def initialize
    @grounded = true
  end

  def land(airport, weather)
    if airport.plane_capacity.length < airport.max_capacity
      @grounded = true
      airport.plane_capacity << self      
    else
      raise "No space available"
    end
  end

  def take_off(airport,weather)
    if weather.status == "Sunny"
      @grounded = false
      airport.plane_capacity.delete(self)
    else
      raise "Weather is stormy"
    end
  end
end
