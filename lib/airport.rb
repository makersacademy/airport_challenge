require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 10

  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new.weather)
    @weather = weather
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    raise "Cannot land plane: No landing during storm" if stormy?

    raise "Cannot land: Airport full" if full?

    @planes << plane
  end

  def take_off
    raise "Cannot take off plane: No take off during storm" if stormy?

    @planes.pop
  end

  private

  def stormy?
    @weather == :stormy
  end

  def full?
    @planes.count >= capacity
  end
end
