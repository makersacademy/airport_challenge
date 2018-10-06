# This is the master class of the airport
require_relative 'plane'

class Airport

  def initialize
    @airport = []
  end

  def instruct_landing(plane)
    fail 'Can not land do to stormy weather' if is_stormy
    @airport << plane
  end

  def instruct_takeoff(plane)
    @airport.pop
    plane
  end

  def empty?
    @airport.empty?
  end

  def is_stormy
    weather = Weather.new
    weather.stormy?
  end

  def number_grounded
    @airport.length
  end



end
