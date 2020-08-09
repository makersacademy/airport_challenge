require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  def initialize
   @planes_at_airport = []
  end

  def plane_lands(plane)
    fail 'Airport is full' if airport_full
    fail 'Plane is already at the airport' if plane.at_airport?
    plane.at_airport?
    @planes_at_airport << plane

  end

  def plane_takes_off(weather)
    fail 'There are no planes at the airport' if airport_empty
    fail 'It is too stormy to take off' if weather.stormy? == true
  #  fail 'The plane has not landed at the airport yet' unless plane.at_airport?
    @planes_at_airport.pop
  end

  def planes_parked
    @planes_at_airport.count

  end

  private

  def airport_full
    @planes_at_airport.count >= DEFAULT_CAPACITY
  end

  def airport_empty
    @planes_at_airport.empty?
  end


end
