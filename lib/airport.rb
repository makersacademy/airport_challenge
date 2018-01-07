require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20

  attr_accessor :weather, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @capacity = capacity
  end

  def land(plane)
    raise 'Planes cant land as the weather is too stormy' if @weather.stormy?
    fail 'This airport is full' if full?
    @planes << plane
  end

  def take_off
    raise 'Planes cant take off as the weather is too stormy' if @weather.stormy?
    @planes.pop
  end

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
