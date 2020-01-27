require './lib/plane.rb'

class Airport
  DEFAULT_CAPACITY = 20

  def initialize
    @capacity
    @planes_at_airport = []
    @current_location
  end

  def capacity(given_capacity = DEFAULT_CAPACITY)
    @capacity = given_capacity
  end

  def plane_land(plane)
    test_flight = Plane.new
    @current_location = test_flight.land
    fail 'Cannot add another plane: Capacity full' if full? == true
    if @current_location == "Airport"
      @planes_at_airport << plane
      @planes_at_airport[0]
    end
  end

  def plane_take_off(plane)
    test_flight = Plane.new
    @current_location = test_flight.take_off
    fail 'No planes at airport' if empty? == true
    if @current_location == "flying"
      @planes_at_airport.pop 
    end
  end

  def empty?
    @planes_at_airport.empty?
  end

  def full?
    @planes_at_airport.count >= DEFAULT_CAPACITY
  end 

end