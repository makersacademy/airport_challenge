require_relative 'plane'

class Airport

  attr_reader :planes

  DEFAULT_CAPACITY = 20

  def initialize(capcacity = DEFAULT_CAPACITY)
    @planes = []
  end

  def land(plane)
    fail 'Cannot land, too stormy' if stormy?
    fail 'Cannot land, airport full' if @planes.length >= DEFAULT_CAPACITY
    @planes << plane
    plane::flying = false
  end

  def takeoff(plane)
    fail 'Cannot take-off, too stormy' if stormy?
    @planes.delete(plane)
    plane::flying = true
  end

  def stormy?
    # add 2+ more fine's below for final checks
    heavens = ['fine','stormy']
    return true if heavens.sample == 'stormy'
  end

end

#I want to test whether the class method is assigning the parameter to an instance variable.
