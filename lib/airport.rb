require 'plane'

class Airport

  DEFAULT_CAPACITY = 50

  def initialize
  	@planes = []
  	@capacity = DEFAULT_CAPACITY
  end

  def land(plane)
  	fail 'Unable to land plane, airport at capacity' if full?
  	plane.landed
  	@planes << plane
  end

  def take_off(plane)
  	plane.has_taken_off
  	@planes.pop
  end

  private

  attr_reader :planes

  def full? 
  	@planes.count == @capacity
  end

  def empty?
  	@planes.empty?
  end

end
