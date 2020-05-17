require_relative 'plane'

class Airport

  attr_reader :hanger

  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
  end

  def landing(plane)
    check_weather
    fail "Airport Full!" if full?

    @hanger << plane
  end

  def depart(plane)
    check_weather
    @hanger.delete(plane)
    plane_departed(plane)
  end

  def weather
    if random_number < 7
      'Sunny'
    else
      'Stormy'
    end
  end

private

  def plane_departed(plane)
    puts "#{plane} departed!"
  end

  def full?
    @hanger.count >= @capacity
  end

  def random_number
    rand(1..10)
  end

  def check_weather
    fail 'Storm Forecast!' if weather == 'Stormy'
  end
end
