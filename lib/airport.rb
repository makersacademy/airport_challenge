require_relative 'plane'

class Airport
  attr_reader :plane

  def landing(plane)
    @plane = plane
  end


end
