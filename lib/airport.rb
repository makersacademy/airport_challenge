require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
  end

  def takeoff(plane)
    @planes.pop
  end

end

#I want to test whether the class method is assigning the parameter to an instance variable.
