# understading airport object
require_relative 'plane'
class Airport
  attr_accessor :capacity, :weather
  attr_reader :plane

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
  end

  def takeoff
    raise 'air is stormy' if stormy?

    @plane
  end

  def land(plane)
    raise 'Airport is full now' if @plane != nil
    raise 'air is stormy' if stormy?

    @plane = plane
  end

private
  def randomweather
    weather = ['sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'sunny',
               'sunny', 'sunny', 'sunny', 'stormy']

    @weather = weather[rand(weather.length - 1)]
  end

  def stormy?
    weather
    @weather == 'stormy'
  end
end
