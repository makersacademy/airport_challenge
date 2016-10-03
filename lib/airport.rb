# class Destination
# end

require './lib/plane'
require './lib/weater'

class Airport

  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @weather = Weather.new
    @specified_capacity = capacity
  end

  attr_reader :planes, :weather, :specified_capacity

  def land?(plane)
    fail "Airport is full" if full?
    fail "Cannot land due to weather" if weather.stormy?
    plane.grounded
    @planes << plane
    "Plane has landed"
  end

  def take_off?(plane)
    fail "Cannot fly due to weather" if weather.stormy?
    if planes.include?(plane)
      plane.flying
      @planes.shift
      "Plane has taken off"
    else
      "Plane is already in the air"
    end
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

end
