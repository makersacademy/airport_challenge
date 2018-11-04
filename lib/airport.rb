require_relative 'plane'

class Airport

  attr_reader :planes, :weather

  def initialize(planes = [], weather = '')
    @planes = planes
    @weather = weather
  end

  def set_weather(condition = rand(10))
    condition == 0 ? @weather = 'stormy' : @weather = 'sunny'
  end

  def land(plane)
    stormy?
    @planes << plane
  end

  def take_off(plane)
    stormy?
    @planes.delete(plane)
  end

private

  def stormy?
    fail "Sorry, it is too stormy to take off." if @weather == 'stormy'
  end

end
