require "plane"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane, weather = Weather.new)
    fail "Weather is dangerous to land in" if weather.condition == "Stormy"
    @hangar << plane
  end

  def takeoff(weather = Weather.new)
    fail "Weather is dangerous to take off in" if weather.condition == "Stormy"
    @hangar.pop
  end
end
