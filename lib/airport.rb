require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :hangar, :capacity, :weather

  CAPACITY = 1

  def initialize(capacity = CAPACITY, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail "Plane is already landed" unless plane.status == 'flying'
    fail "Plane unable to land due to stormy weather" unless check_weather == 'calm'
    fail "Airport is full" unless @hangar.count < capacity
    plane.status = 'landed'
    puts "#{plane} has landed"
    @hangar << plane
  end

  def take_off(plane)
    fail "Plane is already flying" unless plane.status == 'landed'
    fail "Plane unable to take off due to stormy weather" unless check_weather == 'calm'
    plane.status = 'flying'
    @hangar.pop
    puts "#{plane} has taken off"
  end

  private

  def check_weather
    @weather.condition
  end

end
