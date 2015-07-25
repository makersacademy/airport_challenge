require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity, :planes

  def initialize
    @capacity = DEFAULT_CAPACITY
    @planes = []
  end

  def instruct_takeoff(plane)
    plane.takeoff(self)
  end

  def instruct_land(plane)
    plane.land(self)
  end

  def request_land?(plane)
    fail 'Airport full' if full?
    fail 'Weather bad: landing not permitted' if check_weather == "Stormy"
    planes << plane
    true
  end

  def request_takeoff?(plane)
    fail 'Weather bad: landing not permitted' if check_weather == "Stormy"
    return true if (planes.delete(plane) == plane)
    fail "Plane not at this airport"
  end

  def check_weather
    weather_rand = rand(1..8)
    return "Stormy" if weather_rand == 1
    "Sunny"
  end

private

    def full?
      planes.length >= capacity
    end

end
