require_relative 'plane'

class Airport
attr_reader :landed

  def initialize
    @landed = []
  end

  def land(plane)
    @landed << plane
    "The plane has already landed"
  end

  def take_off
    @landed.pop
    "The plane has taken off and it is no longer in the airport"
  end


end
