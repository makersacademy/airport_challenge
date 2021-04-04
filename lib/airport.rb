require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :runway, :weather
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
    @weather = Weather.new
  end
  
  def land(plane)
    fail "Sorry, Airport packed over capacity" if full?

    @runway << plane
  end

  def takeoff(plane)
    stormy?
    @runway.delete(plane)
    return "#{plane} is in the clouds"
  end

  private
  
  def full?
    @runway.length >= @capacity
  end
  
  def stormy?
    fail "Stormy wether, take off not happening" if @weather.forecast == "stormy"
  end

end
