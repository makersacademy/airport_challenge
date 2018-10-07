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
    fail "Plane is in the air" if flying?(plane)
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
    plane.is_a?(Plane) ? plane.status : false
  end

  def flying?(plane)
    flying = plane.status if plane.is_a?(Plane)
    flying == false ? true : false 
  end

  private

  def full?
    @airport.count >= @capacity
  end
end
