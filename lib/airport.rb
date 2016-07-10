require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize(capacity, weather)
    @capacity = capacity
    @planes = []
    @weather = weather
  end


  def land(plane)
    raise "Cannot land plane as airport is full" if full?
    raise "Cannot land plane as it is stormy" if stormy?
    @planes << plane
  end

  def plane
    @planes
  end

  def take_off(plane)
    raise "Cannot take off as it is stormy" if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end

end
