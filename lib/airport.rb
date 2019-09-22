require_relative 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  def take_off
    "#{@plane} has left the airport"
  end

end
