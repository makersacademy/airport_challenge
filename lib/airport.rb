require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane, :weather, :capacity
  DEFAULT_CAPACITY = 5


  def initialize(capacity = DEFAULT_CAPACITY, weather = Weather.new)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    fail "We're full to bursting" if full?
    # weather_checks
    @planes << plane
  end

  def takeoff(plane)
    fail "That plane isn't in the airport" unless @planes.include?(plane)
    weather_checks
    @planes.delete(plane)
  end

  def weather_checks
    fail "ABORT ABORT! STORMY FRONTS ARE COMING" if @weather.stormy?
  end

  def full?
     @planes.count >= @capacity
  end
end
