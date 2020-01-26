require_relative 'plane'
require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 20
  attr_accessor :hangar, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def land(airplane)
    fail "Can't land, weather is stormy!" if Weather.stormy?

    fail "Hangar is full!" unless @hangar.count < @capacity

    fail "This plane is already in a hangar!" if airplane.landed?

    airplane.planestatus
    @hangar << airplane
    @hangar.last
  end

  def takeoff(airplane)
    fail "Can't take off, weather is stormy!" if Weather.stormy?

    fail "Can't take off, plane not in hangar!" unless airplane.landed?

    airplane.planestatus
    @hangar.delete(airplane)
    airplane
  end
end
