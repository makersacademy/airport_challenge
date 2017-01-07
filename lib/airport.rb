require_relative 'plane'

class Airport

  attr_reader :plane

  def landed(plane)
    @plane = plane
  end

end
