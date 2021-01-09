require_relative 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  def take_off
    "#{@plane} has taken off."
  end

end
