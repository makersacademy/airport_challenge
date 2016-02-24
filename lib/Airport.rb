require_relative 'weather.rb'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(weather_reporter, capacity = DEFAULT_CAPACITY)
    @weather_reporter = weather_reporter
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise 'Cannot land plane: airport full' if full?
    raise 'Cannot land plane: weather is stormy' if stormy?
    plane.land(self)
    add_plane(plane)
  end

  def take_off(plane)
    raise 'Cannot take off plane: weather is stormy' if stormy?
    raise 'Cannot take off plane: plane not at this airport' unless at_airport?(plane)
    plane.take_off
    remove_plane(plane)
    plane
  end

  private

  attr_reader :capacity, :weather_reporter

  def full?
    planes.length >= capacity
  end

  def stormy?
    weather_reporter.stormy?
  end

  def at_airport?(plane)
    planes.include?(plane)
  end

  def add_plane(plane)
    planes << plane
  end

  def remove_plane(plane)
    planes.pop
  end
end
