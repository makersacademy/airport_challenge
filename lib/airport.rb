require_relative "plane"
class Airport

  def initialize
    @capacity = 5
    @planes = []
  end

  def land(plane)
    full?
    airport = Airport.new
    plane = Plane.new
    airport.weather("stormy")
    plane.plane_landed
    @planes << plane
  end

  def take_off(plane)
    plane = Plane.new
    airport = Airport.new
    if plane.plane_flying?
      plane.plane_takeoff
    end
  end

  def weather(random)
    random = rand(1..2)
    if random == 1
      return "stormy"
    else
      return "sunny"
    end
  end

  private def full?
    fail "airport is full" if @planes.count >= @capacity
  end
end
