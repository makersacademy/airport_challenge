require 'weather'
require 'plane'

class Airport
  attr_reader :capacity

  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @hangar_planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise "Weather is stormy. No landing is allowed!" if stormy?
    raise "Airport full!" if full?
    return @hangar_planes << plane
  end

  def take_off(plane)
    raise "Weather is stormy. No takeoff is allowed!" if stormy?
    @hangar_planes.delete(plane) if @hangar_planes.include?(plane)
  end

  def stormy? 
    # Return true or false
    return @weather.stormy?
  end

  private

  def full?
    @hangar_planes.length >= @capacity
  end
end
