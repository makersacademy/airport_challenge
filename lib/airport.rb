require_relative 'weather'

class Airport
  CAPACITY_DEFAULT = 5

  def initialize(capacity: CAPACITY_DEFAULT, weather: Weather.new)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Airport full' if full?
    raise 'Bad weather' if stormy?

    @planes << plane
  end

  def takeoff(plane)
    raise 'Bad weather' if stormy?

    @planes.delete(plane)
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather.stormy?
  end
end
