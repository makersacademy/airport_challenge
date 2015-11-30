require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

class Airport

  attr_reader :capacity, :weather, :planes

  DEFAULT_CAPACITY = 50

  def initialize(capacity: DEFAULT_CAPACITY, weather: Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise 'airport full' if full?
    raise 'cannot land with this weather' if stormy?
    plane.land(self)
    planes << plane
  end

  def takeoff(plane)
    raise 'cannot takeoff with this weather' if stormy?
    plane.takeoff(self)
    planes.pop
  end
  #
  # def show_capacity
  #   capacity
  # end
  #
  # def is_stormy?
  #   weather.stormy?
  # end

private

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather.stormy?
  end

end
