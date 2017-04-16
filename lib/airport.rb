require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :planes, :weather

  def initialize(weather = Weather.new)
    @weather = weather
    @planes = []
  end

  def land(plane)
    check_weather
    fail 'plane already landed' if @planes.include? plane
    fail 'can not land, weather condition stormy' if stormy?
    @planes << plane
  end

  def take_off(plane)
    check_weather
    fail 'can not take off, weather condition stormy' if stormy?
    @planes.delete(plane)
  end

private

  def stormy?
    @weather.condition == 'stormy'
  end

  def check_weather
    @weather.condition
  end

end
