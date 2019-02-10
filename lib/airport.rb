require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes_at_airport
  attr_reader :in_the_air
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes_at_airport = []
    @forecast = "sunny"
  end

  def land(plane = @in_the_air.pop)
    fail 'Airport is full' if full?

    fail 'plane cannot take off due to storm' if stormy?

    @planes_at_airport << plane
  end

  def take_off(plane = @planes_at_airport.pop)
    fail 'plane cannot take_off due to storm' if stormy?

    in_the_air = @planes_at_airport.select { |x| x == plane }.pop
    @planes_at_airport = @planes_at_airport.reject { |x| x == plane }
    in_the_air
  end

  def weather(forecast)
    @forecast = forecast
  end

  def full?
    @planes_at_airport.count >= capacity
  end

  def stormy?
    if @forecast == "stormy"
    end
  end
end
