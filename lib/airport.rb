require_relative 'plane'

class Airport

  attr_reader :plane

  def land(plane)
    @plane = plane
  end

end
