require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
      @planes = []
      @capacity = capacity
  end

  def land(plane)
        fail("You cannot land, it is too stormy") if stormy?
        fail("Sorry, the airport is full") if full?
        @planes << plane
  end

  def depart
        fail("You cannot take-off, it is too stormy") if stormy?
        @planes.pop
  end

  def stormy?
      @stormy
  end

  def full?
    @planes.length == @capacity
  end

end
