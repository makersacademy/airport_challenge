# lib/airport.rb
require_relative 'plane'
class Airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    @planes_in_airport.push(plane)
  end

  def take_off(plane)

  end

end
