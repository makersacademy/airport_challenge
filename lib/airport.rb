# lib/airport.rb
require_relative 'plane'
class Airport
  attr_accessor :planes_in_airport

  def initialize
    @planes_in_airport = []
  end

  def land(plane)
    fail "Plane already landed!" if @planes_in_airport.include? plane

    @planes_in_airport.push(plane)
  end

  def take_off(plane)
    fail "Plane not in airport to take off!" unless @planes_in_airport.include? plane

    @planes_in_airport -= [plane]
    puts "Confirming #{plane} has taken off."
  end

  def full?
    if @planes_in_airport.count >= 1
      true
    end
  end
end
