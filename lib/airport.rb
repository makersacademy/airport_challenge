require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane
  attr_accessor :capacity

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @capacity = capacity
    @planes_landed = []
    @weather = weather
  end

  def land(plane)
    fail 'Weather is stormy' unless sunny?
    fail 'Airport is full' if full?

    @planes_landed << plane
    plane
  end

  def take_off(plane)
    fail 'Weather is stormy' unless sunny?

    @planes_landed.pop
    plane.left_airport

  end

  private

  def full?
    @planes_landed.length >= DEFAULT_CAPACITY
  end

  def sunny?
    @weather.sunny
  end
end
