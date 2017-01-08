require_relative 'plane'

class Airport
  attr_reader :planes

  def initialize
    @planes = []
  end


  def take_off(plane)
    plane.flying = true
    @planes.delete(plane)
  end

  def land(plane)
    plane.flying = false
    @planes << plane
  end



end
