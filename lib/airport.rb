require_relative 'weather'

class Airport

  attr_reader :planes, :weather

  def initialize(weather: Weather.new)
    @planes = []
    @weather = weather
  end

  def land(plane)
    plane.land
    @planes.push(plane)
  end

  def take_off(plane)
    fail 'Take off not permited due to poor weather conditions' if weather.stormy?
    plane.take_off
    @planes.delete(plane)
  end

end
