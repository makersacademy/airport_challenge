require './lib/airport'
require './lib/weather'

class Plane
  def land(airport)
    check_weather
    fail "Sorry, this airport is full" if airport.full?
    fail "Sorry, it is stormy, so you can't land" if @weather.stormy?
    airport.planes << self
  end

  def take_off(airport)
    check_weather
    fail "Sorry, it is stormy, so you can't take off" if @weather.stormy?
    airport.planes.delete(self)
    puts "#{self} has taken off from #{airport}."
  end

  def check_weather
    @weather = Weather.new
  end
end
