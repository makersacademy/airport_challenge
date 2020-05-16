require_relative 'plane'

class Airport

  attr_reader :planes 

  def landing(plane)
    @planes = plane
  end

  def take_off
    @planes
  end

end
