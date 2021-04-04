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
    fail "Stormy weather, land somewhere else" if stormy?

    @runway << plane
  end

  def takeoff(plane)
    fail "Stormy weather, take off not happening" if stormy?
    
    correct_airport(plane)
    @runway.delete(plane)
    return "#{plane} is in the clouds"
  end

  private
  
  def full?
    @runway.length >= @capacity
  end
  
  def stormy?
    @weather.forecast == "stormy"
  end

  def correct_airport(plane)
    fail "Plane is in a different airport" unless runway.include? plane
  end

end
