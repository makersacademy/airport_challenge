require './lib/weather'

class Airport
  attr_reader :hanger

  def initialize
    @hanger = []
  end

  def land(plane_to_land)
    fail "Too stormy for landing" if bad_weather?
    @hanger << plane_to_land
  end

  def take_off
    fail "Too stormy for take off" if bad_weather?
    @hanger.pop
  end

private

  def bad_weather?
    return true if Weather.new.forecast == "stormy"
  end

end
