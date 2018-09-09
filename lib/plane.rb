require './lib/airport'
require './lib/weather'

class Plane
  attr_accessor :landed
  attr_accessor :weather
  def initialize
    @landed = false
  end

  def land(airport)
    check_weather
    fail "Sorry, it is stormy, so you can't land" if @weather.stormy?
    fail "Sorry, this airport is full" if airport.full?
    fail "Sorry, the plane is currently flying" if @landed == true
    @landed = true
    airport.planes << self
  end

  def take_off(airport)
    check_weather
    fail "Sorry, it is stormy, so you can't take off" if @weather.stormy?
    fail "Plane not found at this airport" unless airport.planes.include?(self)
    @landed = false
    airport.planes.delete(self)
    puts "#{self} has taken off from #{airport}."
  end

  def check_weather
    @weather = Weather.new
  end
end
