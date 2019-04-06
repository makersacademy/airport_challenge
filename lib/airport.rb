require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 15

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "The plane is unable to land" if stormy?

    raise "The airport is full" if full?

    @planes << plane
  end

  def take_off
    raise "Planes can't take off in stormy weather" if stormy?

    @planes.pop
    "The plane has taken off"
  end

private

  def stormy?
    weather = ["stormy", "sunny"]
    random_weather = weather[rand(0..1)]
    random_weather == "stormy"
  end

  def full?
    @planes.length >= @capacity

  end

end
