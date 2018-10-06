# This is the master class of the airport
require_relative 'plane'

class Airport

  def initialize
    @airport = []
  end

  def instruct_landing(plane)
    @airport << plane
  end

  def instruct_takeoff(plane)
    @airport.pop
    plane
  end

  def empty?
    @airport.empty?
  end

end
