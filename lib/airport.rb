require_relative 'plane'

class Airport

  def plane
    @plane
  end

  def land(plane)
    @plane = plane
  end

end
