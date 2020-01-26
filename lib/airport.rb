require './lib/plane.rb'
class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @capacity
    @planes_at_airport = []
  end

  def capacity(given_capacity = DEFAULT_CAPACITY)
    @capacity = given_capacity
  end

  def plane_land(plane)
    fail 'Cannot add another plane: Capacity full' if full? == true
    @planes_at_airport << plane
    @planes_at_airport[0]
  end

  def plane_take_off(plane)
    fail 'No planes at airport' if empty? == true
    @planes_at_airport.pop 
  end

  def empty?
    @planes_at_airport.empty?
  end

  def full?
    @planes_at_airport.count >= DEFAULT_CAPACITY
  end 

end