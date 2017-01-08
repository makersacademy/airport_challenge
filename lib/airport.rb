require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :plane, :weather, :sunny, :arrivals

  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @plane = plane
    @Weather = weather
    @sunny = weather.sunshine
    @arrivals = []
    @capacity = capacity
  end

  def landed(plane)
      fail "Unable to depart due to stormy weather" unless @sunny
      fail "Airport full" if full?
      @arrivals << plane

  end

  def departure
    fail "Unable to depart due to stormy weather" unless @sunny

      @arrivals.shift

  end

  def full?
    @arrivals.count >= @capacity
  end

end
