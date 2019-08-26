require_relative 'plane'
require_relative 'weather'

class Airport

DEFAULT_CAPACITY = 10
attr_reader :plane

  def initialize(capacity=DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    if full?
      raise "Airport full"
    elsif @planes.include?(plane)
      raise "This plane is already in the airport"
    else
      @planes << plane
    end
  end

  def take_off(plane)
    if !@planes.include?(plane)
      raise "This plane is not in the airport"
    else
      @planes.delete(plane)
    end
  end

  def weather_check
    todays_weather = Weather.new
    todays_weather.forecast
  end

private

def full?
  @planes.length >= @capacity
end

end
