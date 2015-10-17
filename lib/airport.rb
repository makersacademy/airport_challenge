require_relative 'plane'

class Airport

  attr_reader :good_weather, :capacity

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @good_weather = true
    @capacity = capacity
  end

  def land(plane)
    raise 'Airport is full!' if @plane
    @good_weather ? (@plane = plane) : (raise 'Landing denied. Weather is stormy!')
  end

  def take_off
    raise 'No plane at airport' unless @plane
    @good_weather ? @plane : (raise 'Take-off denied. Weather is stormy!')
  end

  def weather
    random = rand(2)
    random == 0 ? @good_weather = true : @good_weather = false
  end

end
