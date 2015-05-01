require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land plane
    @planes << plane
    plane.landed = true
  end

  def takeoff
    @planes.pop.takeoff
  end

end
