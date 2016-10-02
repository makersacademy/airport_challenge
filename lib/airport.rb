require_relative 'plane'
require_relative 'weather'

class Airport
  MAX = 5
  attr_reader :capacity


  def initialize(capacity = MAX)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    fail "Can't land plane :( " if @weather.stormy?
    fail "Airport is full" if full?
    @planes << plane
    return @planes
    puts "#{plane} has landed"
  end

  def take_off
    fail "Can't take off :(" if @weather.stormy?
    plane = @planes.pop
    return plane
    puts "#{plane} has taken off"
  end

private

def full?
  @planes.length >= capacity
end

end
