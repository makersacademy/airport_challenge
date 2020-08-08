require_relative 'plane'

class Airport

  def initialize
   @planes_at_airport = []
  end

  def plane_lands(plane)
    fail 'Airport is full' if @planes_at_airport.count >= 10
    @planes_at_airport << plane
  end

  def plane_takes_off
    fail 'There are no planes at the airport' if @planes_at_airport.empty?
    @planes_at_airport.pop
  end

  def planes_parked
    @planes_at_airport.count
  end

end
