require_relative "plane.rb"
class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []

  end

  def land_plane(plane, weather)
    raise RuntimeError, "Plane cannot land as the Airport is full" if full?
    raise RuntimeError, "Plane cannot land as the conditions are stormy" if weather.stormy?

    @planes << plane
  end

  def take_off(weather)
    raise RuntimeError, "No planes at the airport" if empty?
    raise RuntimeError, "Plane cannot take off due stormy weather" if weather.stormy?

    @planes.pop
    "Plane has taken-off"
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.count < 1
  end

end
