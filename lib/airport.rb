require 'weather'
class AirportFull < StandardError
  def initialize(message)
    super(message)
  end
end

class Airport
  attr_reader :plane, :max_capacity
  def initialize(plane = 0, max_capacity = 3)
    @plane = plane
    @max_capacity = max_capacity
  end

  def land
    raise AirportFull.new("Airport at maximum capacity") if @plane == @max_capacity
    @plane += 1
    puts "Plane has successfully landed"    
  end

  def take_off
    @plane -= 1
    raise StormyWeather.new("Stormy weather, can't take off") if Weather.new.stormy? == "yes"
  end
end