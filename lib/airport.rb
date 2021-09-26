require "plane"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane, weather = Weather.new)
    fail "Weather is dangerous to land in" if weather.get_condition == "Stormy"
    @hangar << plane
  end

  def takeoff
    @hangar.pop
  end
end
