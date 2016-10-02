require_relative 'plane'

class Airport

  def initialize
    @planes = []
  end

  def land(plane)

    @planes << plane
    plane.flying? = false
  end

  def takeoff(plane)

    @planes.pop
    plane.flying? = true
  end

end

#I want to test whether the class method is assigning the parameter to an instance variable.
