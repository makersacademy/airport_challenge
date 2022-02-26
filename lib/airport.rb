require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 100

  attr_reader :plane
  attr_reader :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    raise 'Airport capacity reached. No more landing allowed.' if full?
    @planes << plane
  end

  def take_off_check
    raise 'Warning: stormy weather! Takeoff not allowed.' if stormy_weather?
  end

  def take_off
    take_off_check
    @planes.pop
  end

  private

  def full?
    @planes.length >= @capacity
  end

  def stormy_weather?
    @weather.stormy? == :stormy
  end
end
