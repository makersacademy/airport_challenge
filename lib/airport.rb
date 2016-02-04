require 'weather_reporter'

class Airport

  def initialize(capacity, weather_reporter)
    @capacity = capacity
    @weather_reporter = weather_reporter
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    raise 'Cannot take-off plane: weather is stormy' if stormy?
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy?
    @weather_reporter.stormy?
  end

end
