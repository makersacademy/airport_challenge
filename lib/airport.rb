require 'plane'

class Airport

  def land(plane)
    @plane = plane
  end

  def takeoff(plane)
  end

  def plane
    @plane
  end

end

#I want to test whether the class method is assigning the parameter to an instance variable.
