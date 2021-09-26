require "plane"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane, weather = Weather.new)
    @hangar << plane
  end

  def takeoff
    @hangar.pop
  end
end
