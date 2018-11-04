require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize(planes = [], weather = '')
    @planes = planes
    @weather = weather
  end

  def set_weather
    @weather = 'stormy'
  end

  def land(plane)
    @planes << plane
  end

  def take_off(plane)
    fail "Sorry, it is too stormy to take off." if @weather == 'stormy'
    @planes.delete(plane)
  end

end
