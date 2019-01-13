require './lib/weather'

class Airport
  include Weather
  attr_reader :hanger_capacity

  DEFAULT_HANGER_CAPACITY = 100

  def initialize(hanger_capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @hanger_capacity = hanger_capacity
  end

  def land(plane_to_land)
    fail "Too stormy for landing" if stormy_weather?
    fail "Airport is full" if airport_full?
    fail "Plane has already landed" if in_hanger?(plane_to_land)

    @hanger << plane_to_land
  end

  def take_off(plane_to_leave)
    fail "Too stormy for take off" if stormy_weather?
    fail "Plane not in hanger" if in_hanger?(plane_to_leave) == false

    @hanger.delete(plane_to_leave)
  end

  def in_hanger?(plane)
    @hanger.include?(plane)
  end

private

  def airport_full?
    return true if @hanger.length >= DEFAULT_HANGER_CAPACITY
  end

end
