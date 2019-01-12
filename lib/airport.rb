require_relative 'plane'

class Airport

  def land(plane)
    @airport = plane
  end

  def take_off
    @airport = 'Plane no longer in the airport'
  end


end
