require_relative 'weather'

class Airport

  include Weather

  attr_reader :hangar, :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
  end

  def plane_take_off
    traffic_control
    hangar.first.take_off
    hangar.shift
  end

  def plane_landing(plane)
    traffic_control
    fail "Airport is full" if full?
    plane.land
    hangar << plane
  end

  def traffic_control
    fail "The weather is stormy!" if stormy?
  end

  private

  def full?
    hangar.count >= capacity
  end

end

