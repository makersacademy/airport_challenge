require_relative 'weather'

class Airport
  attr_reader :capacity

  def initialize(capacity = 10)
    @airport = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise "Can't land, stormy weather" if weatherforecast == "stormy"
    fail "Can't land, airport full" if airportfull?
    @airport << plane
  end

  def takeoff(plane)
    raise "Can't take off, stormy weather" if weatherforecast == "stormy"
    @airport.delete(plane)
  end

  def listplanes
    @airport
  end

  def weatherforecast
    @weather.weatherforecast
  end

  def airportfull?
    return false if @airport.length != @capacity
  end
end
