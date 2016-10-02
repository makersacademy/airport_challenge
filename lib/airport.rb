require_relative 'plane'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    fail 'Cannot land, too stormy' if self.weather == 'stormy'
    @planes << plane
    plane::flying = false
  end

  def takeoff(plane)
    fail 'Cannot take-off, too stormy' if self.weather == 'stormy'
    @planes.delete(plane)
    plane::flying = true
  end

  def weather
    # add 2+ more fine's below for final checks
    heavens = ['fine','stormy']
    heavens.sample
  end

end

#I want to test whether the class method is assigning the parameter to an instance variable.
