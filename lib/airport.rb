# lib/airport.rb
require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_AIRPORT_CAPACITY = 10
  attr_accessor :planes_in_airport
  attr_reader :capacity
  attr_accessor :stormy

  def initialize(capacity = DEFAULT_AIRPORT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
    @stormy = Weather.new.stormy?
  end

  def land(plane)

    fail "Plane already landed!" if @planes_in_airport.include? plane

    fail "Airport is full!" if full?

    fail "Stormy weather, plane cannot land" if @stormy == true

    @planes_in_airport.push(plane)
  end

  def take_off(plane)
    fail "Plane not in airport!" unless @planes_in_airport.include? plane

    fail "Stormy weather, plane cannot take off" if @stormy == true

    @planes_in_airport -= [plane]
    puts "Confirming #{plane} has taken off."
  end

  def full?
    true if @planes_in_airport.count >= @capacity
  end

end
