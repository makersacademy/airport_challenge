require 'plane'

class Airport
  attr_reader :hangar
  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar << plane
    "Landed"
  end
end
