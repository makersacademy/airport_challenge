require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    raise "This airport is full." if full?

    raise "Stormy weather, landing not possible." if weather_report == "stormy"

    @planes << plane
  end

  def take_off
    raise "Stormy weather, take-off not possible." if weather_report == "stormy"

    @planes[-1].flying
    @planes.pop
  end

  private

  def full?
    @planes.size >= @capacity
  end
end
