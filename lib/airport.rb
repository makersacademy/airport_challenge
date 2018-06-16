require_relative 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  attr_reader :plane

end
