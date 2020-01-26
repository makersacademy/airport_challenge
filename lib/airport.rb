require_relative "plane.rb"
require_relative "weather.rb"

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = Array.new
    @capacity = capacity
  end

  def land(plane)
    return raise("Airport is full") if full?
    
    return raise(
      "Plane has already landed at airport") if @planes.include?(plane)

    return raise("Weather is stormy, cannot land") if stormy?

    @planes.push(plane)
  end

  def take_off(plane)
    return raise(
      "Plane not at airport, cannot take off") unless @planes.include?(plane)

    return raise("Weather is stormy, cannot take off") if stormy?

    @planes.delete(plane)
  end
  
  def full?
    @planes.count >= capacity
  end

  def stormy?
    Weather.stormy?
  end

end
