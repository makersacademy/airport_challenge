require_relative 'plane'
require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes
  attr_reader :weather
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'This plane has already landed' if planes.include?(plane)
    fail 'DANGER. STORMY WEATHER.' if weather == 'stormy'
    self.full? ? (fail "Cannot land. The airport is full.") : planes << plane
  end

  def take_off(plane)
    weather == 'stormy' ? (fail 'DANGER. STORMY WEATHER.') : planes.delete(plane)
  end

  def weather 
    weather = Weather.new
    weather.weather
  end

  def full?
    planes.length >= capacity
  end
end