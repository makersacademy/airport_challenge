require_relative 'weather'
require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_landed = []
  end
  def land plane, weather
    raise "weather is too stormy for the plane to land" if weather.stormy?
    raise "cannot land plane due to full airport" if full?
    @planes_landed << plane
  end
  def take_off plane, weather
    raise "weather is too stormy for take off" if weather.stormy?
    @planes_landed.pop
  end
  def planes_landed
    @planes_landed
  end
  def capacity
    @capacity
  end

  private
  def full?
     @planes_landed.count == @capacity
  end
end
