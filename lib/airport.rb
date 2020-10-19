require_relative 'weather'

class Airport
  attr_reader :capacity

  def initialize(capacity = 20)
    @airport = []
    @capacity = capacity
  end

  def land(plane)
    return "Can't land because of weather" if weather_check == "stormy"
    return "Airport full" if full?

    @airport << plane
    
  end

  def take_off(plane)
    return "Can't take off because of weather" if weather_check == "stormy"

    @airport.delete(plane)
  end

  def list_planes
    @airport
  end

  def full?
    return false if @airport.length != @capacity
  end
end
