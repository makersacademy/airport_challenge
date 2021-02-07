require './lib/plane'
require './lib/weather'

class Airport
  attr_reader :plane, :weather
  attr_accessor :capacity
  DEFAULT_CAPACITY = 1

  def initialize(capacity=DEFAULT_CAPACITY, weather = Weather.new)
    @plane = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail  'Cannot land the plane, poor weather' if @weather.storm? == :storm
    fail 'Warning, airport full' if full?
    @plane << plane
  end

  def take_off
    fail 'Cannot take off, poor weather' if @weather.storm? == :storm
    [@plane.pop]
  end

  private

  def full?
    @plane.count >= capacity
  end

end
