require './lib/weather'

class Airport
  attr_reader :hanger, :hanger_capacity

  DEFAULT_HANGER_CAPACITY = 100

  def initialize(hanger_capacity = DEFAULT_HANGER_CAPACITY)
    @hanger = []
    @hanger_capacity = hanger_capacity
  end

  def land(plane_to_land)
    fail "Too stormy for landing" if bad_weather?
    fail "Airport is full" if airport_full?
    @hanger << plane_to_land
  end

  def take_off(plane_to_leave)
    fail "Too stormy for take off" if bad_weather?
    @hanger.delete(plane_to_leave)
  end

private

  def bad_weather?
    return true if Weather.new.forecast == "stormy"
  end

  def airport_full?
    return true if @hanger.length >= DEFAULT_HANGER_CAPACITY
  end

end
