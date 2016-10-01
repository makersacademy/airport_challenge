require_relative 'weather'

class Airport

  def initialize
    @planes = []
  end

  def land_plane(plane)
    @planes << plane
    #@planes.last
    "Plane has landed"
  end

  def take_off(plane)
    if random_weather == "sunny"
      @planes.delete(plane)
      "the plane has taken off"
    else
      "plane cannot take off, it's stormy"
    end
  end



end
