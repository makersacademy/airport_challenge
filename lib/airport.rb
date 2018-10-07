# This is the master class of the airport
require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity, :plane

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @airport = []
    @capacity = capacity
  end

  def instruct_landing(plane)
    fail 'Can not land do to stormy weather' if stormy?
    fail 'No free places to land' if full?
    fail 'Plane grounded at other airport' if grounded?(plane)
    plane.status(true) if plane.is_a?(Plane)
    @airport << plane
  end

  def instruct_takeoff(plane)
    fail 'Can not takeoff do to stormy weather' if stormy?
    @airport.pop
    plane
  end

  def number_grounded
    @airport.length
  end

  def empty?
    @airport.empty?
  end

  def stormy?(weather)
    @weather = weather
  end

  def grounded?(plane)
    @plane = plane
    @plane.status if @plan.is_a?(Plane)
  end

  private

  def full?
    @airport.count >= @capacity
  end
end
