require_relative 'weather'

class Airport

  attr_reader :planes
  def initialize()
    @planes = []
  end

  def land(plane)
    plane.land(self)
    @planes << plane
  end

  def take_off(plane)
    raise "Cannot take off: weather stormy" if stormy? true
    plane.take_off
  end

  private
  
  def stormy?
    weather.stormy?
  end
end
