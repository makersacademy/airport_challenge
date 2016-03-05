require_relative 'airplane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def capacity
    @capacity
  end

  def planes
    @planes
  end

  def land_plane(airplane)
    fail "Cannot land due to inclement weather." if weather?
    airplane.land(airplane)
    @planes << airplane
  end

  private

  def weather?
    weather = Weather.new
    weather.inclement?
  end

end
