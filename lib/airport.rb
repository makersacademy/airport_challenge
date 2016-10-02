require_relative 'plane'
require_relative 'weather'

class Airport
  MAX = 5
  attr_reader :capacity, :weather


  def initialize(capacity = MAX, weather)
    @capacity = capacity
    @planes = []
    @weather = Weather.new

  end

  def land(plane)

    #raise "Can't land plane :( " if weather.stormy?
    fail "Airport is full" if full?
    @planes << plane
    return @planes
    puts "#{plane} has landed"
  end

  def take_off(runway)
    #fail "Can't take off :(" if weather.stormy?
    @planes.delete(runway)
    return runway
    puts "#{runway} has taken off"
  end

  def weather_conditions
    puts weather.stormy?
  end

private

def full?
  @planes.length >= capacity
end


end
