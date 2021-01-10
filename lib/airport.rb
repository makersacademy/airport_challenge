$all_grounded_planes = []
class Airport
  attr_reader :planes_in_airport, :capacity

  def initialize(capacity = 20)
    @planes_in_airport = []
    @weather = generate_weather
    @capacity = capacity
  end

  def generate_weather(weather = 0)
    if sunny? || stormy?
      @weather = weather
    else
      rand_num = [1, 2, 3, 4, 5, 6].sample
      rand_num <= 5 ? @weather = "sunny" : @weather = "stormy"
    end
    @weather
  end

  def land(plane)
    raise "Weather is too bad for landing" if stormy?
    raise "Airport at full capacity" if full?
    raise "Plane is not flying" if present?(plane)
    raise "Plane is not flying" if plane_elsewhere(plane)

    @planes_in_airport << plane
    $all_grounded_planes << plane
    @planes_in_airport
  end

  def takeoff(plane)
    raise "Weather is too bad for takeoff" if stormy?
    raise "No planes available for takeoff" if empty?
    raise "Plane not at this airport" unless present?(plane)

    @planes_in_airport.delete(plane)
  end

  def full?
    @planes_in_airport.length >= @capacity
  end

  def empty?
    @planes_in_airport == []
  end

  def sunny?
    @weather == 'sunny'
  end

  def stormy?
    @weather == "stormy"
  end

  def present?(plane)
    @planes_in_airport.include?(plane)
  end

  def plane_elsewhere(plane)
    $all_grounded_planes.include?(plane)
  end

end

class Plane
end
