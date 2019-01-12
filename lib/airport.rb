# lib/airport.rb
require_relative 'plane'
class Airport

  DEFAULT_AIRPORT_CAPACITY = 10
  attr_accessor :planes_in_airport
  attr_reader :capacity

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane)
    fail "Plane already landed!" if @planes_in_airport.include? plane

    fail "Airport is full!" if full?

    @planes_in_airport.push(plane)
  end

  def take_off(plane)
    fail "Plane not in airport!" unless @planes_in_airport.include? plane

    @planes_in_airport -= [plane]
    puts "Confirming #{plane} has taken off."
  end

  def full?
    true if @planes_in_airport.count >= @capacity
  end

end
