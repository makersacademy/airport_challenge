require './lib/weather'

class Airport
  include Weather
  attr_reader :hanger_capacity

  DEFAULT_HANGER_CAPACITY = 100

  def initialize(capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @hanger_capacity = capacity
  end

  def land(plane)
    fail "Too stormy for landing" if stormy?
    fail "Plane has already landed" if in_hanger?(plane)
    fail "Plane is not in air" if plane.landed
    fail "Airport is full" if airport_full?

    plane.make_land(true)
    @hanger << plane
  end

  def take_off(plane)
    fail "Too stormy for take off" if stormy?
    fail "Plane not in hanger" unless in_hanger?(plane)

    plane.make_land(nil)
    @hanger.delete(plane)
  end

  def in_hanger?(plane)
    @hanger.include?(plane)
  end

private

  def airport_full?
    @hanger.length >= @hanger_capacity
  end

end
