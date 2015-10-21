require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 6
  attr_reader :planes, :weather, :capacity

  def initialize( capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land plane
    raise StandardError, 'Airport is full' unless !full?
    fail 'Weather is stormy' if @weather.stormy?
    # raise StandardError,'Weather is bad' if @weather.stormy?
    raise StandardError, 'Plane is not flying' if plane.flying == false
    plane.landed
    planes << plane
  end

  def take_off plane
    raise StandardError,'Weather is stormy' if @weather.stormy?
    raise StandardError,'The plane is not in this airport' unless @planes.include?(plane)
    raise StandardError,'Plane is already flying'if plane.flying == true
    plane.fly
    planes.pop
  end

  def full?
    planes.length == @capacity
  end
end
