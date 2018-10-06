# This is the master class of the airport
require_relative 'plane'
require_relative 'weather'

class Airport

  def initialize
    @airport = []
  end

  def instruct_landing(plane)
    fail 'Can not land do to stormy weather' if stormy?
    @airport << plane
  end

  def instruct_takeoff(plane)
    fail 'Can not takeoff do to stormy weather' if stormy?
    @airport.pop
    plane
  end

  def empty?
    @airport.empty?
  end

  def stormy?(weather)
    weather
  end

  def number_grounded
    @airport.length
  end
end
