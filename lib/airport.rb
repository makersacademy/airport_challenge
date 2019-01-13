require_relative 'weather'
class Airport
  DEFAULT_CAPACITY = 10
  def initialize(weather: Weather.new,capacity: DEFAULT_CAPACITY)
    @weather = weather
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Stormy weather!' if stormy?
    raise 'Airport Full!' if full?
    @planes << plane
  end

  def take_off
    raise 'Stormy weather!' if stormy?
    @planes.pop
  end

  private

  def full?
    @planes.count >= @capacity
  end

  def stormy?
    @weather.stormy?
  end
end
