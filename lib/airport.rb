require_relative 'plane'

class Airport
  attr_reader :planes

  def land(plane)
    @planes = plane
  end

end
