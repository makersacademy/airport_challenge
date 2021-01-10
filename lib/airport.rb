class Airport
  attr_reader :planes_in_airport

  def initialize
    @planes_in_airport = []
    @weather = generate_weather("sunny")
  end

  def generate_weather(weather)
    return @weather = weather if weather.downcase == "sunny" || weather.downcase == "stormy"
  end

  def land(plane)
    raise "Weather is too bad for landing" if @weather == "stormy"
    @planes_in_airport << plane
    @planes_in_airport
  end

  def takeoff(plane)
    raise "Weather is too bad for takeoff" if @weather == "stormy"
    raise "No planes available for takeoff" if @planes_in_airport == []
    @planes_in_airport.pop
  end
end

class Plane
end
