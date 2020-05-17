require './lib/plane'
require './lib/weather'

class Airport

  attr_reader :plane
  attr_reader :capacity

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @at_the_airport = []
    @capacity = capacity

  end

  def land(plane)
    @plane = plane
    raise 'airport full' if capacity_check

    @at_the_airport.push(plane)
  end

  def takeoff(plane)
    @at_the_airport.delete(plane)
  end

  def confirm_takeoff
    print 'plane has taken off'
  end

  private

  def capacity_check
    @at_the_airport.count >= @capacity
  end

 end
