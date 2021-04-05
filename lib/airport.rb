require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :hanger, :capacity, :weather
  DEFAULT_CAPACITY = 1

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hanger = []
    @weather = Weather.new
  end

  def land(plane)
    raise 'already on ground' if plane.landed?
    raise 'unable to land plane, hanger is full' if hanger_full?
    raise 'unable to land, weather is stormy' if prevent_landing?
    
    plane.location(self)
    @hanger << plane
  end

  def take_off(plane)
    raise 'unable to take_off, no planes at hanger' if hanger_is_empty?
    raise 'unable to fly, weather is stormy' if prevent_take_off?

    @hanger.delete(plane)
  end

  def hanger_is_empty?
    @hanger.empty?
  end

  def hanger_full?
    @hanger.count >= @capacity
  end

  def prevent_take_off?
    weather.stormy_weather?
  end

  def prevent_landing?
    weather.stormy_weather?
  end
end
