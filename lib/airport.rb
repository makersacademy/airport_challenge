require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10
  attr_reader :hangar
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
    @weather = Weather.new
  end

  def land(plane)
    raise "Airport is full" if full?

    raise "Plane cannot land due to storm" if @weather.stormy?

    @hangar << plane
  end

  def take_off(plane)
    raise "Plane cannot take off due to storm" if @weather.stormy?

    hangar.delete(plane)
    "The plane: #{plane} has taken off"
  end

  def report_storm
    @weather.storm = true
  end

  private

  def full?
    @hangar.length >= @capacity
  end
end
