require_relative "plane"

class Airport

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
  end

  def takeoff(plane)
    "#{plane} has taken off"
  end

end
