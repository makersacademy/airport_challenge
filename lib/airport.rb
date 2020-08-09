require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
   @planes_at_airport = []
   @capacity = capacity
  end

  def plane_lands(plane)
    fail 'Airport is full' if airport_full
    fail 'Plane is already at the airport' if plane.at_airport? == true
    plane.at_airport?
    @planes_at_airport << plane

  end

  def plane_takes_off(weather)
    fail 'There are no planes at the airport' if airport_empty
    fail 'It is too stormy to take off' if weather.stormy? == true
    @planes_at_airport.pop
  end

  private

  attr_reader :planes_at_airport

  def airport_full
    @planes_at_airport.count >= capacity
  end

  def airport_empty
    @planes_at_airport.empty?
  end

#  def check_plane(plane)
  #  plane.each_with_index do |check,index|
  #    next unless check == plane
  #    planes_at_airport.delete_at(index)
  #    plane.at_airport? == false
  #    return plane
  #  end
#  end


end
