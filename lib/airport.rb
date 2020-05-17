require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def landing(plane)
    weather_check
    fail "Airport at capacity" if full?

    @planes.push(plane)
  end

  def depart(plane)
    weather_check
    @planes.delete(plane)
    plane_left_notification(plane)
  end

  def weather
    if random_number < 8
      'sunny'
    else
      'stormy'
    end
  end

private

  def plane_left_notification(plane)
    puts "#{plane} has left the airport"
  end

  def full?
    @planes.count >= @capacity
  end

  def random_number
    rand(1..10)
  end

  def weather_check
    fail 'DANGER: Storm Forecast' if weather == 'stormy'
  end

end
