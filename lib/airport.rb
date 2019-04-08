require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "It is too stormy to land" if stormy?
    raise "Airport full" if full?
    @planes << plane
    end

  def take_off
    raise "It is too stormy to take off" if stormy?
    @planes.pop
  end

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.forecast == "Stormy"
  end

end
