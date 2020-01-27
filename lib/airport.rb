require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @capacity
    @planes_at_airport = []
  end

  def capacity(given_capacity = DEFAULT_CAPACITY)
    @capacity = given_capacity
    # TODO: not sure capacity actually changeable
  end

  def plane_land(plane)
    test_flight = Plane.new
    @current_location = test_flight.land
    fail "plane cannot land" if @current_location != "Airport"

    fail 'Cannot add another plane: Capacity full' if full? == true

    @planes_at_airport << plane
    @planes_at_airport[0]
  end

  def plane_take_off(*)
    test_flight = Plane.new
    @current_location = test_flight.take_off
    fail "plane can't take off" if @current_location != "flying"

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
