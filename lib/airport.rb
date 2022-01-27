require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hanger, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
  end

  def land(plane, weather = Weather.new)
    fail 'Hanger is full' if full?
    fail 'Weather is stormy' if weather.stormy
    plane.instance_variable_set(:@flying, false)
    @hanger << plane
  end

  def take_off(plane, weather = Weather.new)
    fail 'Weather is stormy' if weather.stormy
    fail 'Plane is already flying!' if plane.flying
    plane.instance_variable_set(:@flying, true)
    @hanger.delete(plane)
  end

  def flying?(plane)
    plane.flying
  end

  private
  
  def full?
    @hanger.count >= @capacity
  end
end
