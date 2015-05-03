require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @planes = []
    @capacity = 10
  end

  def land plane
    weather = Weather.new
    weather.forecast
    fail "Cannot land during a storm" if weather.stormy?
    if full?
      fail "Airport is full"
    else
      (plane.landed = true) && (plane.flying = false)
      planes << plane
    end
  end

  def take_off plane
    plane.flying = true
    plane.landed = false
    planes.delete(plane)
  end

  attr_accessor :planes

  def full?
    planes.count >= @capacity
  end
end