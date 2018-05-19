require_relative 'plane'

class Airport
AIRPORT_CAPACITY = 11

  attr_accessor :capacity

  def initialize(capacity = AIRPORT_CAPACITY)
    @planes = Array.new(11, Plane.new)
    @capacity = capacity
  end

  def land(plane)
    fail "Captain, you cannot land at this airport as it
    is full" if @planes.count >= 11
    @planes << plane
  end

  def take_off(plane)
    @planes.pop
    puts "There are now #{@planes.count} planes in the airport."
  end



  # def taken_off?
  #   true
  # end

end
