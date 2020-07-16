require_relative './plane.rb'

class Airport
  attr_reader :planes_in_airport, :capacity
  DEFAULT_CAPACITY = 100
  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_in_airport = []
    @capacity = capacity
  end

  def land(plane)
    fail "There is a storm" if storm?
    fail "Airport is full" if full?

    @planes_in_airport << plane
  end

  def take_off
    fail "There is a storm" if storm?
    fail "Airport is empty" if empty?

    @planes_in_airport.pop
    print "Plane has taken off"
  end

  def storm?
    true if rand(1..10) == 7
  end

  private
  def full?
    @planes_in_airport.length >= @capacity
  end

  def empty?
    @planes_in_airport.empty?
  end

end
