
class Airport
  attr_accessor :capacity, :airport_name
  DEFAULT_CAPACITY = 5
  DEFAULT_AIRPORT = "airport"

  def initialize(capacity = DEFAULT_CAPACITY, airport_name = "airport")
    @planes = []
    @capacity = capacity
    @airport_name = "airport"
  end

  def random_weather
    ["stormy", "sunny"].sample
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

  def land_plane_full(plane)
    if airport_full?
      "plane cannot land as the airport is full"
    else
      @planes << plane
    end

  end

  def airport_full?
    @planes.count >= @capacity
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
