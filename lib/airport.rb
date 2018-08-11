require_relative "plane"

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def takeoff(plane)
    @hangar.delete(plane)
    "#{plane} has taken off"
  end

end
