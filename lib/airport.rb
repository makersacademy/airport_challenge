require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :runway
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @runway = []
  end
  
  def land(plane)
    fail "Sorry, Airport packed over capacity" if full?

    @runway << plane
  end

  def takeoff(plane)
    @runway.delete(plane)
    return "#{plane} is in the clouds"
  end

  private
  
  def full?
    @runway.length >= @capacity
  end

end
