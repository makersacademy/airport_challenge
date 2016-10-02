require_relative 'plane'
require_relative 'weather'

class Airport
  MAX = 5
  attr_reader :capacity, :weather
  attr_accessor :plane


  def initialize(capacity = MAX)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    #raise "Can't land plane :( " if weather.stormy?
    raise "Airport is full" if full?
    plane.landing
    @planes << plane
    return @planes
  end

  def take_off(runway)
    #fail "Can't take off :(" if weather.stormy?
    raise "Plane already in flight" if runway.flying?
    runway.taking_off
    @planes.delete(runway)
    return runway
  end

  def weather_conditions
    puts weather.stormy?
  end

private

  def full?
    @planes.length >= capacity
  end


end
