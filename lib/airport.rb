require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes, :capacity

  DEFAULTCAPACITY = 20

  def initialize(capacity=DEFAULTCAPACITY)
    @planes = []
    @capacity = capacity
  end

  def call_land(plane)
    fail 'Bad weather means plane can\'t land' if Weather.new.stormy?
    fail 'The airport is full' if full?
    plane.land
    @planes << plane
  end

  def takeoff
    planes.pop
  end

  private

  def full?
    planes.length+1 > capacity
  end

end
