require_relative 'plane'

class Airport

  def initialize
   @planes_at_airport = []
  # @capacity = capacity
  end

  def plane_lands(plane)
    fail 'Airport is full' if @planes_at_airport.count >= 10
    fail 'Plane is already at the airport' if plane.at_airport?
    plane.at_airport?
    @planes_at_airport << plane

  end

  def plane_takes_off
    fail 'There are no planes at the airport' if @planes_at_airport.empty?
    @planes_at_airport.pop
    #Plane.new.take_off
  end

  def planes_parked
    @planes_at_airport.count

  end

end
