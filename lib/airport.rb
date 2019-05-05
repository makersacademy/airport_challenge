require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff
    @planes.pop
    "The plane is no longer in the airport"
  end

end
