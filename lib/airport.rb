require_relative "plane"

class Airport
  attr_accessor :hangar, :plane

  def initialize
    @hangar = []
    @plane = plane
  end

  def land(plane)
    @hangar.push("easyjet")
  end

end
