class Airport
  attr_reader :planes_in_airport, :capacity

  def initialize(capacity = 20)
    @planes_in_airport = []
    @weather = generate_weather
    @capacity = capacity
  end

  def generate_weather(weather = 0)
    if weather == "stormy" || weather == "sunny"
      @weather = weather
      @weather
    else
      rand_num = [1, 2, 3, 4, 5, 6].shuffle.first
      rand_num <= 5 ? @weather = "sunny" : @weather == "stormy"
      @weather
    end
  end

  def land(plane)
    raise "Weather is too bad for landing" if stormy?
    raise "Airport at full capacity" if full?

    @planes_in_airport << plane
    @planes_in_airport
  end

  def takeoff(plane)
    raise "Weather is too bad for takeoff" if stormy?
    raise "No planes available for takeoff" if empty?

    @planes_in_airport.pop
  end

  def full?
    @planes_in_airport.length >= @capacity
  end

  def empty?
    @planes_in_airport == []
  end

  def stormy?
    @weather == "stormy"
  end
end

class Plane
end
