require 'weather'

class Airport
  DEFAULT_CAPACITY = 20
  attr_reader :planes

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail "Airport full" if full?
    if good_weather?
      @planes.push(plane)
    else
      fail "Bad weather" 
    end
  end

  def take_off(plane)
    if good_weather?
      @planes.pop
    else
      fail "Bad weather"
    end
  end

  def good_weather?
    weather = Weather.new
    case weather.forecast
    when "clear"
      true
    when "stormy"
      false
    end
  end

  def full?
    @planes.length >= @capacity
  end
end
