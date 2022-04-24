require_relative 'plane'

class Airport
  attr_reader :stored_planes

  def initialize
    @stored_planes = []
  end

  def land(plane)
    @stored_planes << plane
  end

  def depart(plane)
    @stored_planes.delete(plane)
  end

end
