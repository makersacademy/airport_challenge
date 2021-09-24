require './lib/plane.rb'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end
  def land(plane)
    @plane = plane
  end

  def takeoff(plane)
    @plane
  end
end