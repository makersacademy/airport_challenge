require_relative 'plane'

class Airport
  attr_reader :stored_planes

  def land(plane)
    @stored_planes = plane
  end
end
