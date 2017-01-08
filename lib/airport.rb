require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize(weather = Weather.new)
    @weather = weather
  end

  def stormy?
    @weather == :stormy
  end

  def land(plane)
    fail "Sorry, no landings during stormy weather!" if stormy?
    @planes = plane
  end

  def takeoff(plane)
    fail "Sorry, no takeoffs during stormy weather!" if stormy?
    @planes = nil
  end

end
