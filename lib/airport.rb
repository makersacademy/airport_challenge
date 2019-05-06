require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :plane_list, :weather
  DEFAULT_CAPACITY = 5

  def initialize(weather = Weather.new, capacity = DEFAULT_CAPACITY)
    @plane_list = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise 'Cannot land due to stormy weather' if weather.stormy?
    @plane_list << plane
  end

  def take_off
    raise 'Cannot take off due to stormy weather' if weather.stormy?
    @plane_list.pop
  end

  def full?
    @plane_list >= @capacity
  end

end
