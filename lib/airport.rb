require_relative 'plane'

class Airport
  attr_accessor :landed
  def initialize
    @landed_planes = []
  end

  def land(plane)
    @landed_planes << plane
    plane.landed = true
  end

  # def landed?
  #
  # end

end
