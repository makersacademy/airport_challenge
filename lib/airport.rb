require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :plane, :weather, :sunny

  def initialize(weather = Weather.new)
    @plane = plane
    @Weather = weather
    @sunny = weather.sunshine

  end

  def landed(plane)
      fail "Unable to depart due to stormy weather" unless @sunny

      @plane = plane

  end

  def departure
    fail "Unable to depart due to stormy weather" unless @sunny
      @plane

  end

  def full?

  end

end
