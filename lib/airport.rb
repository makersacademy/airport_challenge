require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land_plane(plane)
    if random_weather == "sunny"
      @planes << plane
      #@planes.last
      "Plane has landed"
    else
      "Plane cannot land as it is stormy"
    end
  end

  def take_off(plane)
    if random_weather == "sunny"
      @planes.delete(plane)
      "the plane has taken off"
    else
      "plane cannot take off, it's stormy"
    end
  end

  def airport_full?
    @planes.count >= capacity
  end

end
